import 'dart:io';
import 'dart:isolate';
import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:path/path.dart' as p;

/// Message sent to the scanner isolate.
class ScanRequest {
  final SendPort replyPort;
  final List<String> directories;
  final List<String> excludedFolders;

  ScanRequest({
    required this.replyPort,
    required this.directories,
    required this.excludedFolders,
  });
}

/// Represents a scanned audio file with parsed metadata.
class ScannedSong {
  final String path;
  final String title;
  final String artist;
  final String album;
  final int durationMs;
  final int fileSize;
  final DateTime dateModified;

  ScannedSong({
    required this.path,
    required this.title,
    required this.artist,
    required this.album,
    required this.durationMs,
    required this.fileSize,
    required this.dateModified,
  });
}

/// Top-level function that runs in the background Isolate.
/// Must be a top-level function (not a closure or method).
void _scannerIsolateEntry(ScanRequest request) async {
  final results = <ScannedSong>[];
  final supportedExtensions = {
    '.mp3',
    '.flac',
    '.m4a',
    '.aac',
    '.ogg',
    '.wav',
    '.opus',
  };

  for (final dirPath in request.directories) {
    final dir = Directory(dirPath);
    if (!dir.existsSync()) continue;

    try {
      final entities = dir.listSync(recursive: true, followLinks: false);
      for (final entity in entities) {
        // Skip if this entity is within an excluded folder
        bool isExcluded = false;
        for (final excludedPath in request.excludedFolders) {
          if (entity.path.startsWith(excludedPath)) {
            isExcluded = true;
            break;
          }
        }
        if (isExcluded) continue;

        if (entity is! File) continue;
        final ext = p.extension(entity.path).toLowerCase();
        if (!supportedExtensions.contains(ext)) continue;

        try {
          final stat = entity.statSync();
          final basename = p.basenameWithoutExtension(entity.path);

          // Attempt to parse metadata using audio_metadata_reader (Pure Dart)
          String title = basename;
          String artist = 'Unknown Artist';
          String album = 'Unknown Album';
          int durationMs = 0;

          try {
            final metadata = readMetadata(entity, getImage: false);
            title = metadata.title?.isNotEmpty == true
                ? metadata.title!
                : basename;
            final String rawArtist = metadata.artist?.isNotEmpty == true
                ? metadata.artist!
                : 'Unknown Artist';

            // Smart Artist Parsing Regex
            final splitRegex = RegExp(
              r'(?:\s+feat\.?\s+|\s+ft\.?\s+|\s*&\s*|\s*,\s*)',
              caseSensitive: false,
            );
            final artistList = rawArtist
                .split(splitRegex)
                .map((a) => a.trim())
                .where((a) => a.isNotEmpty)
                .toList();
            artist = artistList.isNotEmpty
                ? artistList.join(', ')
                : 'Unknown Artist';

            album = metadata.album?.isNotEmpty == true
                ? metadata.album!
                : 'Unknown Album';
            durationMs = metadata.duration?.inMilliseconds ?? 0;
          } catch (e) {
            // Fallback to basename if parsing fails
          }

          final song = ScannedSong(
            path: entity.path,
            title: title,
            artist: artist,
            album: album,
            durationMs: durationMs,
            fileSize: stat.size,
            dateModified: stat.modified,
          );
          results.add(song);
        } catch (_) {
          // Skip files that can't be read
        }
      }
    } catch (_) {
      // Skip directories that can't be listed
    }
  }

  request.replyPort.send(results);
}

/// Manages background Isolate-based scanning.
class IsolateScanner {
  /// Scans the given directories for audio files in a background Isolate.
  /// Returns a list of [ScannedSong] objects.
  static Future<List<ScannedSong>> scan(
    List<String> directories,
    List<String> excludedFolders,
  ) async {
    final receivePort = ReceivePort();

    final isolate = await Isolate.spawn(
      _scannerIsolateEntry,
      ScanRequest(
        replyPort: receivePort.sendPort,
        directories: directories,
        excludedFolders: excludedFolders,
      ),
      debugName: 'AudioScanner',
    );

    final results = await receivePort.first as List<ScannedSong>;
    isolate.kill(priority: Isolate.immediate);
    receivePort.close();

    return results;
  }
}
