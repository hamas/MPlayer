import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:mplayer/features/audio/logic/mplayer_audio_handler.dart';

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
Stream<List<Song>> allSongs(Ref ref) {
  return ref.watch(songRepositoryProvider).watchAllSongs();
}

@riverpod
Stream<List<Song>> recentSongs(Ref ref) {
  return ref.watch(songRepositoryProvider).watchRecentSongs();
}

@Riverpod(keepAlive: true)
Future<MPlayerAudioHandler> audioHandler(Ref ref) async {
  return await initAudioService();
}
