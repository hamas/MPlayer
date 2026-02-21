import 'package:drift/drift.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/lyrics/data/lrclib_service.dart';
import 'package:mplayer/features/lyrics/models/lyrics.dart';
import 'package:mplayer/core/network/network_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyrics_repository.g.dart';

@Riverpod(keepAlive: true)
LyricsRepository lyricsRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  final service = ref.watch(lrclibServiceProvider);
  return LyricsRepository(db, service);
}

class LyricsRepository {
  final AppDatabase _db;
  final LrclibService _service;

  LyricsRepository(this._db, this._service);

  /// Fetches lyrics for a song, checking the local database cache first.
  Future<Lyrics?> fetchLyrics({
    required String songId,
    required String title,
    required String artist,
    required String album,
    required int durationSeconds,
  }) async {
    // Check cache
    final cached = await (_db.select(
      _db.lyricsTable,
    )..where((t) => t.songId.equals(songId))).getSingleOrNull();

    if (cached != null) {
      return Lyrics(
        id: cached.lrclibId,
        trackName: title,
        artistName: artist,
        albumName: album,
        duration: durationSeconds.toDouble(),
        instrumental: false,
        plainLyrics: cached.plainLyrics,
        syncedLyrics: cached.syncedLyrics,
      );
    }

    // Fetch from API
    try {
      final response = await _service.getLyrics(
        trackName: title,
        artistName: artist,
        albumName: album,
        duration: durationSeconds,
      );

      if (response.isSuccessful && response.body != null) {
        final lyrics = Lyrics.fromJson(response.body);

        // Save to cache
        await _db
            .into(_db.lyricsTable)
            .insertOnConflictUpdate(
              LyricsTableCompanion(
                songId: Value(songId),
                lrclibId: Value(lyrics.id),
                plainLyrics: Value(lyrics.plainLyrics),
                syncedLyrics: Value(lyrics.syncedLyrics),
              ),
            );

        return lyrics;
      }
    } catch (e) {
      // Log or handle error
    }

    return null;
  }

  /// Searches for lyrics manually if the automatic lookup fails.
  Future<List<Lyrics>> searchLyrics(String query) async {
    try {
      final response = await _service.searchLyrics(query);
      if (response.isSuccessful && response.body != null) {
        final List<dynamic> list = response.body;
        return list.map((e) => Lyrics.fromJson(e)).toList();
      }
    } catch (e) {
      // Log or handle error
    }
    return [];
  }
}
