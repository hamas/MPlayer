import 'package:chopper/chopper.dart';
import 'package:dio/dio.dart';
import 'package:mplayer/features/lyrics/data/lrclib_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_module.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'User-Agent':
            'MPlayer-Flutter/1.0.0 (https://github.com/hamas/MPlayer)',
      },
    ),
  );

  // Add logging interceptor if needed
  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  return dio;
}

@Riverpod(keepAlive: true)
ChopperClient chopper(Ref ref) {
  return ChopperClient(
    baseUrl: Uri.parse('https://lrclib.net/api'),
    services: [LrclibService.create()],
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
  );
}

@Riverpod(keepAlive: true)
LrclibService lrclibService(Ref ref) {
  return ref.watch(chopperProvider).getService<LrclibService>();
}
