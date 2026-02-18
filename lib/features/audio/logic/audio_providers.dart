import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:mplayer/features/audio/models/song.dart' as model;

part 'audio_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@Riverpod(keepAlive: true)
SongRepository songRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SongRepository(db);
}

@riverpod
Stream<List<model.Song>> allSongs(Ref ref) {
  return ref.watch(songRepositoryProvider).watchAllSongs();
}
