import 'package:chopper/chopper.dart';

part 'lrclib_service.chopper.dart';

@ChopperApi(baseUrl: 'https://lrclib.net/api')
abstract class LrclibService extends ChopperService {
  @GET(path: '/get')
  Future<Response> getLyrics({
    @Query('track_name') required String trackName,
    @Query('artist_name') required String artistName,
    @Query('album_name') required String albumName,
    @Query('duration') required int duration,
  });

  @GET(path: '/search')
  Future<Response> searchLyrics(@Query('q') String query);

  static LrclibService create([ChopperClient? client]) =>
      _$LrclibService(client);
}
