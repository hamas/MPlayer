import 'dart:io';
import 'package:drift/drift.dart';
import 'package:id3/id3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/audio/models/song.dart' as model;
import 'package:path/path.dart' as p;

class SongRepository {
  final AppDatabase _db;

  SongRepository(this._db);

  Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      // Request generic storage permissions.
      // On Android 13+, this should also include READ_MEDIA_AUDIO.
      final Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.audio,
        Permission
            .manageExternalStorage, // Optional, might be needed for broad access
      ].request();

      return statuses[Permission.storage]!.isGranted ||
          statuses[Permission.audio]!.isGranted ||
          statuses[Permission.manageExternalStorage]!.isGranted;
    }
    return true;
  }

  Future<void> scanAndSync() async {
    final hasPermission = await requestPermissions();
    if (!hasPermission) {
      // Allow partial success if some permissions are granted?
      // For now, throw or return.
      // throw Exception("Permission denied");
    }

    final List<Directory> searchDirs = [
      Directory('/storage/emulated/0/Music'),
      Directory('/storage/emulated/0/Download'),
      Directory('/storage/emulated/0/Audio'),
    ];

    final List<FileSystemEntity> files = [];

    for (final dir in searchDirs) {
      if (dir.existsSync()) {
        try {
          files.addAll(dir.listSync(recursive: true, followLinks: false));
        } catch (e) {
          // Ignore listing errors
        }
      }
    }

    final audioFiles = files.where((file) {
      final ext = p.extension(file.path).toLowerCase();
      return file is File &&
          (ext == '.mp3' ||
              ext == '.m4a' ||
              ext == '.flac' ||
              ext == '.wav' ||
              ext == '.ogg');
    }).cast<File>();

    await _db.transaction(() async {
      for (final file in audioFiles) {
        try {
          String? title;
          String? artist;
          String? album;
          const int duration = 0;

          try {
            // Only parse MP3 tags for now as id3 supports MP3
            if (p.extension(file.path).toLowerCase() == '.mp3') {
              final mp3 = MP3Instance(file.readAsBytesSync());
              if (mp3.parseTagsSync()) {
                final meta = mp3.getMetaTags();
                title = meta?['Title'];
                artist = meta?['Artist'];
                album = meta?['Album'];
              }
            }
          } catch (e) {
            // Ignore tag errors
          }

          title ??= p.basenameWithoutExtension(file.path);
          artist ??= '<unknown>';
          album ??= '<unknown>';

          final stat = file.statSync();

          final entry = SongsTableCompanion(
            id: Value(file.path),
            title: Value(title),
            artist: Value(artist),
            album: Value(album),
            uri: Value(file.path),
            duration: const Value(duration),
            size: Value(stat.size),
            // data: Value(file.path),
            dateAdded: Value(stat.modified),
            artworkUri: const Value(null),
          );

          await _db.into(_db.songsTable).insertOnConflictUpdate(entry);
        } catch (e) {
          // Ignore processing errors
        }
      }
    });
  }

  Stream<List<model.Song>> watchAllSongs() {
    return _db.select(_db.songsTable).watch().map((rows) {
      return rows
          .map(
            (row) => model.Song(
              id: row.id,
              title: row.title,
              artist: row.artist,
              album: row.album,
              uri: row.uri,
              duration: row.duration,
              size: row.size,
              dateAdded: row.dateAdded,
              isFavorite: row.isFavorite,
              playCount: row.playCount,
            ),
          )
          .toList();
    });
  }
}
