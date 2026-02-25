import 'dart:io';
import 'package:drift/drift.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/core/services/isolate_scanner.dart';
import 'package:mplayer/features/audio/models/song.dart' as model;
// ignore: unused_import
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'song_repository.g.dart';

@Riverpod(keepAlive: true)
SongRepository songRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SongRepository(db);
}

class SongRepository {
  final AppDatabase _db;

  SongRepository(this._db);

  // ─── Permissions ────────────────────────────────────────────────────────────

  Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      final statuses = await [Permission.storage, Permission.audio].request();
      return statuses.values.any((s) => s.isGranted);
    }
    return true;
  }

  // ─── Scan & Sync (Isolate-backed) ───────────────────────────────────────────

  /// Scans audio directories in a background Isolate and syncs to the database.
  /// This is the primary entry point for library indexing.
  Future<void> scanAndSync() async {
    await requestPermissions();

    const searchDirs = [
      '/storage/emulated/0/Music',
      '/storage/emulated/0/Download',
      '/storage/emulated/0/Audio',
    ];

    final excludedRows = await _db.select(_db.excludedFoldersTable).get();
    final excludedDirs = excludedRows.map((e) => e.path).toList();

    // Run the heavy file-system scan in a background Isolate
    final scanned = await IsolateScanner.scan(searchDirs, excludedDirs);

    if (scanned.isEmpty) return;

    // Batch-insert all songs for maximum performance
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.songsTable,
        scanned.map(
          (s) => SongsTableCompanion(
            id: Value(s.path),
            title: Value(s.title),
            artist: Value(s.artist),
            album: Value(s.album),
            uri: Value(s.path),
            duration: Value(s.durationMs),
            size: Value(s.fileSize),
            dateAdded: Value(s.dateModified),
          ),
        ),
      );
    });
  }

  // ─── Queries ─────────────────────────────────────────────────────────────────

  Stream<List<model.Song>> watchAllSongs() {
    return (_db.select(_db.songsTable)
          ..orderBy([(t) => OrderingTerm(expression: t.title)]))
        .watch()
        .map((rows) => rows.map(_mapToModel).toList());
  }

  Stream<List<model.Song>> watchRecentSongs({int limit = 20}) {
    return (_db.select(_db.songsTable)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.dateAdded, mode: OrderingMode.desc),
          ])
          ..limit(limit))
        .watch()
        .map((rows) => rows.map(_mapToModel).toList());
  }

  Future<model.Song?> getSongById(String id) {
    return (_db.select(_db.songsTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull()
        .then((row) => row != null ? _mapToModel(row) : null);
  }

  Future<List<model.Song>> getSongsByIds(List<String> ids) {
    return (_db.select(_db.songsTable)..where((t) => t.id.isIn(ids)))
        .get()
        .then((rows) => rows.map(_mapToModel).toList());
  }

  /// Returns a compact "ID|Title|Artist" list for AI playlist generation.
  Future<List<String>> getSongsForAi() async {
    final rows = await _db.select(_db.songsTable).get();
    return rows.map((r) => '${r.id}|${r.title}|${r.artist}').toList();
  }

  // ─── Mapping ─────────────────────────────────────────────────────────────────

  model.Song _mapToModel(SongsTableData row) {
    return model.Song(
      id: row.id,
      title: row.title,
      artist: row.artist,
      album: row.album,
      uri: row.uri,
      duration: row.duration,
      size: row.size,
      dateAdded: row.dateAdded,
      artworkUri: row.artworkUri,
      isFavorite: row.isFavorite,
      playCount: row.playCount,
      skipCount: row.skipCount,
    );
  }

  Future<void> updateSong(model.Song song) async {
    await (_db.update(
      _db.songsTable,
    )..where((t) => t.id.equals(song.id))).write(
      SongsTableCompanion(
        title: Value(song.title),
        artist: Value(song.artist),
        album: Value(song.album),
      ),
    );
  }

  Future<void> addDownloadedSong({
    required String path,
    required String title,
    required String artist,
    required String album,
    String? artworkUri,
  }) async {
    final file = File(path);
    final size = file.existsSync() ? await file.length() : 0;

    await _db
        .into(_db.songsTable)
        .insert(
          SongsTableCompanion(
            id: Value(path),
            title: Value(title),
            artist: Value(artist),
            album: Value(album),
            uri: Value(path),
            size: Value(size),
            dateAdded: Value(DateTime.now()),
            artworkUri: Value(artworkUri),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  // ─── Excluded Folders ────────────────────────────────────────────────────────

  Future<List<String>> getExcludedFolders() async {
    final rows = await _db.select(_db.excludedFoldersTable).get();
    return rows.map((r) => r.path).toList();
  }

  Future<void> addExcludedFolder(String path) async {
    await _db
        .into(_db.excludedFoldersTable)
        .insert(
          ExcludedFoldersTableCompanion.insert(path: path),
          mode: InsertMode.insertOrIgnore,
        );
  }

  Future<void> removeExcludedFolder(String path) async {
    await (_db.delete(
      _db.excludedFoldersTable,
    )..where((t) => t.path.equals(path))).go();
  }
}
