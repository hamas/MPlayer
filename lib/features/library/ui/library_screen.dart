import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mplayer/features/library/ui/batch_tag_editor_screen.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsync = ref.watch(allSongsProvider);

    return Scaffold(
      body: songsAsync.when(
        data: (songs) =>
            songs.isEmpty ? const _EmptyLibrary() : _SongList(songs: songs),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _EmptyLibrary extends StatelessWidget {
  const _EmptyLibrary();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_music_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            'Your library is empty',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the scan button to find your music',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _SongList extends ConsumerStatefulWidget {
  final List<Song> songs;
  const _SongList({required this.songs});

  @override
  ConsumerState<_SongList> createState() => _SongListState();
}

class _SongListState extends ConsumerState<_SongList> {
  final Set<String> _selectedIds = {};

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _openBatchEditor() {
    final selectedSongs = widget.songs
        .where((s) => _selectedIds.contains(s.id))
        .toList();
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) => BatchTagEditorScreen(songs: selectedSongs),
          ),
        )
        .then((_) {
          if (mounted) {
            setState(() {
              _selectedIds.clear();
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final isSelectionMode = _selectedIds.isNotEmpty;

    return Scaffold(
      body: ListView.builder(
        itemCount: widget.songs.length,
        itemBuilder: (context, index) {
          final song = widget.songs[index];
          final isSelected = _selectedIds.contains(song.id);

          return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                selected: isSelected,
                selectedTileColor: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.5),
                leading: isSelectionMode
                    ? Checkbox(
                        value: isSelected,
                        onChanged: (val) => _toggleSelection(song.id),
                      )
                    : CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        child: Text(
                          song.title.isNotEmpty
                              ? song.title[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                title: Text(
                  song.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  song.artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onLongPress: () => _toggleSelection(song.id),
                onTap: () {
                  if (isSelectionMode) {
                    _toggleSelection(song.id);
                  } else {
                    ref.read(audioHandlerProvider).whenData((handler) {
                      handler.playFromMediaId(song.id);
                    });
                  }
                },
              )
              .animate()
              .slideY(
                begin: 0.1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
              )
              .fade();
        },
      ),
      floatingActionButton: isSelectionMode
          ? FloatingActionButton.extended(
              onPressed: _openBatchEditor,
              icon: const Icon(Icons.edit),
              label: Text('Edit ${_selectedIds.length} Songs'),
            )
          : null,
    );
  }
}
