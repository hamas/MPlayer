import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mplayer/features/audio/models/song.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/library/logic/tag_editor_service.dart';

class TagEditorScreen extends ConsumerStatefulWidget {
  final Song song;

  const TagEditorScreen({super.key, required this.song});

  @override
  ConsumerState<TagEditorScreen> createState() => _TagEditorScreenState();
}

class _TagEditorScreenState extends ConsumerState<TagEditorScreen> {
  late TextEditingController _titleController;
  late TextEditingController _artistController;
  late TextEditingController _albumController;
  late TextEditingController _trackController;
  late TextEditingController _yearController;
  late TextEditingController _genreController;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.song.title);
    _artistController = TextEditingController(text: widget.song.artist);
    _albumController = TextEditingController(text: widget.song.album);
    _trackController =
        TextEditingController(); // Need to extract from song if available
    _yearController = TextEditingController();
    _genreController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    _albumController.dispose();
    _trackController.dispose();
    _yearController.dispose();
    _genreController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);

    final success = await ref
        .read(tagEditorProvider)
        .updateSongMetadata(
          filePath: widget.song.uri,
          title: _titleController.text,
          artist: _artistController.text,
          album: _albumController.text,
          trackNumber: int.tryParse(_trackController.text),
          year: int.tryParse(_yearController.text),
          genre: _genreController.text,
        );

    setState(() => _isSaving = false);

    if (success) {
      final updatedSong = widget.song.copyWith(
        title: _titleController.text,
        artist: _artistController.text,
        album: _albumController.text,
      );
      await ref.read(songRepositoryProvider).updateSong(updatedSong);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Metadata updated successfully')),
        );
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update metadata')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Tags'),
        actions: [
          if (_isSaving)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            )
          else
            IconButton(icon: const Icon(Icons.save), onPressed: _save),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _artistController,
              decoration: const InputDecoration(labelText: 'Artist'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _albumController,
              decoration: const InputDecoration(labelText: 'Album'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _trackController,
                    decoration: const InputDecoration(labelText: 'Track #'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _yearController,
                    decoration: const InputDecoration(labelText: 'Year'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),
          ],
        ),
      ),
    );
  }
}
