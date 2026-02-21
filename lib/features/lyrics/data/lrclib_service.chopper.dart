// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'lrclib_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$LrclibService extends LrclibService {
  _$LrclibService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = LrclibService;

  @override
  Future<Response<dynamic>> getLyrics({
    required String trackName,
    required String artistName,
    required String albumName,
    required int duration,
  }) {
    final Uri $url = Uri.parse('https://lrclib.net/api/get');
    final Map<String, dynamic> $params = <String, dynamic>{
      'track_name': trackName,
      'artist_name': artistName,
      'album_name': albumName,
      'duration': duration,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchLyrics(String query) {
    final Uri $url = Uri.parse('https://lrclib.net/api/search');
    final Map<String, dynamic> $params = <String, dynamic>{'q': query};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
