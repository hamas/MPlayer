import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/server/logic/local_server.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_provider.g.dart';

@Riverpod(keepAlive: true)
LocalServer localServer(Ref ref) {
  final songRepository = ref.watch(songRepositoryProvider);
  return LocalServer(songRepository);
}

@riverpod
class ServerStatus extends _$ServerStatus {
  @override
  bool build() {
    // Load initial state from settings?
    // Ideally we'd return a Future<bool> or Stream<bool>, but keeping it simple synchronous bool for UI toggle is easier if we don't mind initial state being off.
    // However, let's try to restore it.
    // Actually, simple toggle is fine for now as per plan.
    // But let's sync it with repo.
    return false;
  }

  Future<void> toggle() async {
    final server = ref.read(localServerProvider);
    // state is the current boolean
    if (state) {
      await server.stop();
      state = false;
    } else {
      await server.start();
      state = true;
    }
  }
}
