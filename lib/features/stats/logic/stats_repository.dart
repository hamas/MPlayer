import 'package:drift/drift.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/audio/models/song.dart' as model;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stats_repository.g.dart';

@Riverpod(keepAlive: true)
StatsRepository statsRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return StatsRepository(db);
}

class StatsRepository {
  final AppDatabase _db;

  StatsRepository(this._db);

  // ─── Queries ─────────────────────────────────────────────────────────────────

  Future<List<model.Song>> getMostPlayed({int limit = 10}) async {
    final rows =
        await (_db.select(_db.songsTable)
              ..where((t) => t.playCount.isBiggerThanValue(0))
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.playCount,
                  mode: OrderingMode.desc,
                ),
              ])
              ..limit(limit))
            .get();

    return rows.map(_mapToModel).toList();
  }

  Future<List<model.Song>> getMostSkipped({int limit = 10}) async {
    final rows =
        await (_db.select(_db.songsTable)
              ..where((t) => t.skipCount.isBiggerThanValue(0))
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.skipCount,
                  mode: OrderingMode.desc,
                ),
              ])
              ..limit(limit))
            .get();

    return rows.map(_mapToModel).toList();
  }

  Future<int> getTotalListeningTimeMs() async {
    final query = _db.selectOnly(_db.songsTable)
      ..addColumns([_db.songsTable.duration, _db.songsTable.playCount]);

    final rows = await query.get();
    int totalMillis = 0;
    for (final row in rows) {
      final dur = row.read(_db.songsTable.duration) ?? 0;
      final count = row.read(_db.songsTable.playCount) ?? 0;
      totalMillis += dur * count;
    }
    return totalMillis;
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
}
