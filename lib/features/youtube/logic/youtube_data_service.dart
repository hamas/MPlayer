import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/youtube/logic/youtube_auth_service.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

// Providers
final youtubeDataServiceProvider = Provider((ref) {
  return YouTubeDataService(ref);
});

final ytExtractorProvider = Provider((ref) => YouTubeAudioExtractor());

class YouTubeDataService {
  final Ref _ref;
  final http.Client _client = http.Client();

  YouTubeDataService(this._ref);

  Future<Map<String, dynamic>?> _post(
    String endpoint,
    Map<String, dynamic> payload,
  ) async {
    final cookies = await _ref.read(youtubeAuthProvider.notifier).getCookies();

    final response = await _client.post(
      Uri.parse(
        'https://music.youtube.com/youtubei/v1/$endpoint?prettyPrint=false',
      ),
      headers: {
        'Content-Type': 'application/json',
        ...?(cookies != null ? {'Cookie': cookies} : null),
        'Origin': 'https://music.youtube.com',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.0.0 Safari/537.36',
      },
      body: jsonEncode({
        "context": {
          "client": {
            "clientName": "WEB_REMIX",
            "clientVersion": "1.20240428.01.00",
            "gl": "US",
            "hl": "en",
          },
        },
        ...payload,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Fetch "Liked Songs"
  Future<List<Map<String, String>>> getLikedSongs() async {
    final data = await _post('browse', {'browseId': 'LM'});
    return _parseTrackList(data);
  }

  // Generic Search
  Future<List<Map<String, String>>> search(String query) async {
    final data = await _post('search', {'query': query});
    return _parseTrackList(data);
  }

  // Recursive robust json tree parser that scans for tracks regardless of API layout restructuring
  List<Map<String, String>> _parseTrackList(Map<String, dynamic>? data) {
    final List<Map<String, String>> tracks = [];
    if (data == null) return tracks;

    _findMediaItems(data, tracks);
    return tracks;
  }

  void _findMediaItems(dynamic node, List<Map<String, String>> tracks) {
    if (node is List) {
      for (var item in node) {
        _findMediaItems(item, tracks);
      }
    } else if (node is Map<String, dynamic>) {
      if (node.containsKey('musicResponsiveListItemRenderer')) {
        final renderer = node['musicResponsiveListItemRenderer'];
        try {
          final columns = renderer['flexColumns'];
          final titleRun =
              columns[0]['musicResponsiveListItemFlexColumnRenderer']['text']['runs'][0];
          final title = titleRun['text'];
          final videoId =
              renderer['playlistItemData']?['videoId'] ??
              renderer['navigationItemData']?['videoId'] ??
              titleRun['navigationEndpoint']?['watchEndpoint']?['videoId'];

          if (videoId != null && title != null) {
            String artist = 'Unknown';
            if (columns.length > 1) {
              final artistRuns =
                  columns[1]['musicResponsiveListItemFlexColumnRenderer']?['text']?['runs'];
              if (artistRuns != null && artistRuns.isNotEmpty) {
                artist = artistRuns[0]['text'];
              }
            }

            String thumb = '';
            final thumbnails =
                renderer['thumbnail']?['musicThumbnailRenderer']?['thumbnail']?['thumbnails'];
            if (thumbnails != null &&
                thumbnails is List &&
                thumbnails.isNotEmpty) {
              thumb = thumbnails.last['url'];
            }

            tracks.add({
              'id': videoId,
              'title': title,
              'artist': artist,
              'thumbnail': thumb,
            });
          }
        } catch (_) {}
      }
      for (var value in node.values) {
        _findMediaItems(value, tracks);
      }
    }
  }
}

class YouTubeAudioExtractor {
  final YoutubeExplode _yt = YoutubeExplode();

  Future<String?> getAudioStreamUrl(String videoId) async {
    try {
      final manifest = await _yt.videos.streamsClient.getManifest(videoId);
      final audioStreams = manifest.audioOnly;
      if (audioStreams.isNotEmpty) {
        return audioStreams.withHighestBitrate().url.toString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
