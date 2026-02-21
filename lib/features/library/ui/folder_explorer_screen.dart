import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/core/services/folder_tree_service.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:audio_service/audio_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

final folderTreeProvider = FutureProvider.family<FolderNode?, String>((
  ref,
  path,
) async {
  return FolderTreeService.getFolderTree(path);
});

class FolderExplorerScreen extends ConsumerStatefulWidget {
  const FolderExplorerScreen({super.key});

  @override
  ConsumerState<FolderExplorerScreen> createState() =>
      _FolderExplorerScreenState();
}

class _FolderExplorerScreenState extends ConsumerState<FolderExplorerScreen> {
  String? _currentRoot;
  final List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _initStorage();
  }

  Future<void> _initStorage() async {
    Directory? dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0');
      if (!dir.existsSync()) {
        dir = await getExternalStorageDirectory();
      }
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    if (dir != null) {
      final String path = dir.path;
      setState(() {
        _currentRoot = path;
      });
    }
  }

  void _navigateTo(String path) {
    if (_currentRoot != null) {
      _history.add(_currentRoot!);
    }
    setState(() {
      _currentRoot = path;
    });
  }

  void _goBack() {
    if (_history.isNotEmpty) {
      setState(() {
        _currentRoot = _history.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentRoot == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final folderTree = ref.watch(folderTreeProvider(_currentRoot!));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentRoot!.split('/').last.isEmpty
              ? 'Storage'
              : _currentRoot!.split('/').last,
        ),
        leading: _history.isNotEmpty
            ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: _goBack)
            : null,
      ),
      body: folderTree.when(
        data: (node) {
          if (node == null || node.children.isEmpty) {
            return const Center(
              child: Text('No supported music files found here'),
            );
          }

          final directories = node.children
              .where((n) => n.isDirectory)
              .toList();
          final files = node.children.where((n) => !n.isDirectory).toList();

          return ListView(
            children: [
              ...directories.map(
                (dir) =>
                    ListTile(
                          leading: const Icon(
                            Icons.folder,
                            color: Colors.amber,
                          ),
                          title: Text(dir.name),
                          subtitle: Text('${dir.children.length} items'),
                          onTap: () => _navigateTo(dir.path),
                        )
                        .animate()
                        .slideX(
                          begin: 0.05,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutBack,
                        )
                        .fade(),
              ),
              ...files.map(
                (file) =>
                    ListTile(
                          leading: const Icon(
                            Icons.music_note,
                            color: Colors.blue,
                          ),
                          title: Text(file.name),
                          subtitle: Text(_formatSize(file.size ?? 0)),
                          onTap: () async {
                            final audioHandler = await ref.read(
                              audioHandlerProvider.future,
                            );
                            final song = await ref
                                .read(songRepositoryProvider)
                                .getSongById(file.path);

                            MediaItem mediaItem;
                            if (song != null) {
                              mediaItem = song.toMediaItem();
                            } else {
                              mediaItem = MediaItem(
                                id: file.path,
                                title: file.name,
                                artist: 'Unknown Artist',
                                extras: {'uri': file.path},
                              );
                            }

                            await audioHandler.playFromQueue([mediaItem], 0);
                          },
                        )
                        .animate()
                        .slideX(
                          begin: 0.05,
                          duration: 300.ms,
                          curve: Curves.easeOutBack,
                        )
                        .fade(),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }

  String _formatSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }
}
