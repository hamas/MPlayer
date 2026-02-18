import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mplayer/core/database/app_database.dart';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:mplayer/features/audio/models/song.dart' as model;
import 'package:audio_service/audio_service.dart';
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
Stream<List<model.Song>> allSongs(Ref ref) {
  return ref.watch(songRepositoryProvider).watchAllSongs();
}

@Riverpod(keepAlive: true)
Future<AudioHandler> audioHandler(Ref ref) async {
  return await initAudioService();
}
