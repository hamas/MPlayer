import 'dart:io';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

class LocalServer {
  final SongRepository _songRepository;
  HttpServer? _server;

  LocalServer(this._songRepository);

  Future<void> start() async {
    if (_server != null) return;

    final router = Router();

    router.get('/status', (Request request) {
      return Response.ok('MPlayer Server Running');
    });

    router.get('/stream/<id>', (Request request, String id) async {
      // Decode ID if needed (though router params are usually decoded)
      final decodedId = Uri.decodeComponent(id);

      final song = await _songRepository.getSongById(decodedId);

      if (song == null) {
        return Response.notFound('Song not found');
      }

      final file = File(song.uri);
      if (!file.existsSync()) {
        return Response.notFound('File not found on device');
      }

      final stat = await file.stat();

      // Basic streaming support
      // For better seeking support, we might need to handle Range headers manually or use a library.
      // shelf_static / shelf_static_handler might be better but let's do basic for now.

      return Response.ok(
        file.openRead(),
        headers: {
          'Content-Type':
              'audio/mpeg', // Assuming MP3 for now, logic can be improved
          'Content-Length': stat.size.toString(),
          'Content-Disposition': 'inline; filename="${song.title}.mp3"',
        },
      );
    });

    // Handle Range requests for seeking?
    // Shelf Response.ok doesn't handle partial content automatically with openRead.
    // We would need to parse the Range header.
    // For MVP, standard serving is okay, but seeking might be broken in some clients.

    final handler = const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router.call);

    // Bind to any IPv4 address
    _server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
    // ignore: avoid_print
    print('Serving at http://${_server!.address.host}:${_server!.port}');
  }

  Future<void> stop() async {
    await _server?.close();
    _server = null;
  }

  String? get address => _server?.address.host;
  int? get port => _server?.port;
  String? get url => _server != null
      ? 'http://${_server!.address.address}:${_server!.port}'
      : null;
}
