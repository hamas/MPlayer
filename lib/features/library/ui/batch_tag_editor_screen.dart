import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/logic/song_repository.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:mplayer/features/library/logic/tag_editor_service.dart';

class BatchTagEditorScreen extends ConsumerStatefulWidget {
  final List<Song> songs;
  const BatchTagEditorScreen({super.key, required this.songs});

  @override
  ConsumerState<BatchTagEditorScreen> createState() =>
      _BatchTagEditorScreenState();
}

class _BatchTagEditorScreenState extends ConsumerState<BatchTagEditorScreen> {
  final _albumController = TextEditingController();
  final _artistController = TextEditingController();
  final _yearController = TextEditingController();
  final _genreController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _albumController.dispose();
    _artistController.dispose();
    _yearController.dispose();
    _genreController.dispose();
    super.dispose();
  }

  Future<void> _saveBatch() async {
    setState(() => _isSaving = true);

    final tagEditor = ref.read(tagEditorProvider);
    final repo = ref.read(songRepositoryProvider);

    final album = _albumController.text.trim();
    final artist = _artistController.text.trim();
    final yearText = _yearController.text.trim();
    final genre = _genreController.text.trim();

    final year = int.tryParse(yearText);

    for (var song in widget.songs) {
      final success = await tagEditor.updateSongMetadata(
        filePath: song.id,
        album: album.isNotEmpty ? album : null,
        artist: artist.isNotEmpty ? artist : null,
        year: year,
        genre: genre.isNotEmpty ? genre : null,
      );

      if (success) {
        // Also update the database song
        final updatedSong = song.copyWith(
          album: album.isNotEmpty ? album : song.album,
          artist: artist.isNotEmpty ? artist : song.artist,
        );
        await repo.updateSong(updatedSong);
      }
    }

    if (mounted) {
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Updated ${widget.songs.length} songs')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batch Edit (${widget.songs.length} files)'),
        actions: [
          if (_isSaving)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(icon: const Icon(Icons.save), onPressed: _saveBatch),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Keep fields empty to leave them unchanged.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _artistController,
            decoration: const InputDecoration(
              labelText: 'Artist',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _albumController,
            decoration: const InputDecoration(
              labelText: 'Album',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _genreController,
            decoration: const InputDecoration(
              labelText: 'Genre',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Year',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
