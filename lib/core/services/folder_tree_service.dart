import 'dart:io';
import 'dart:isolate';
import 'package:path/path.dart' as p;

/// Represents a node in the folder tree (either a directory or a file).
class FolderNode {
  final String path;
  final String name;
  final bool isDirectory;
  final int? size;
  final DateTime? modified;
  final List<FolderNode> children;

  FolderNode({
    required this.path,
    required this.name,
    required this.isDirectory,
    this.size,
    this.modified,
    this.children = const [],
  });
}

/// Request for the folder scanner isolate.
class FolderScanRequest {
  final SendPort replyPort;
  final String rootPath;
  final Set<String> supportedExtensions;

  FolderScanRequest({
    required this.replyPort,
    required this.rootPath,
    required this.supportedExtensions,
  });
}

/// Top-level function for background folder traversal.
void _folderScannerIsolateEntry(FolderScanRequest request) {
  final root = Directory(request.rootPath);
  if (!root.existsSync()) {
    request.replyPort.send(null);
    return;
  }

  FolderNode scan(Directory dir) {
    final nodes = <FolderNode>[];
    try {
      final entities = dir.listSync(followLinks: false);
      for (final entity in entities) {
        final name = p.basename(entity.path);
        if (entity is Directory) {
          nodes.add(scan(entity));
        } else if (entity is File) {
          final ext = p.extension(entity.path).toLowerCase();
          if (request.supportedExtensions.contains(ext)) {
            final stat = entity.statSync();
            nodes.add(
              FolderNode(
                path: entity.path,
                name: name,
                isDirectory: false,
                size: stat.size,
                modified: stat.modified,
              ),
            );
          }
        }
      }
    } catch (_) {
      // Skip restricted directories
    }

    return FolderNode(
      path: dir.path,
      name: p.basename(dir.path).isEmpty ? dir.path : p.basename(dir.path),
      isDirectory: true,
      children: nodes,
    );
  }

  final result = scan(root);
  request.replyPort.send(result);
}

/// Service to browse local storage as a folder tree using background isolates.
class FolderTreeService {
  static final Set<String> supportedExtensions = {
    '.mp3',
    '.flac',
    '.m4a',
    '.aac',
    '.ogg',
    '.wav',
    '.opus',
  };

  /// Traverses the given root path and returns a [FolderNode] tree.
  static Future<FolderNode?> getFolderTree(String rootPath) async {
    final receivePort = ReceivePort();

    try {
      await Isolate.spawn(
        _folderScannerIsolateEntry,
        FolderScanRequest(
          replyPort: receivePort.sendPort,
          rootPath: rootPath,
          supportedExtensions: supportedExtensions,
        ),
        debugName: 'FolderScanner',
      );

      final result = await receivePort.first;
      return result as FolderNode?;
    } catch (e) {
      return null;
    } finally {
      receivePort.close();
    }
  }
}
