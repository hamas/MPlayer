import 'dart:io';
import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagEditorProvider = Provider((ref) => TagEditorService());

class TagEditorService {
  Future<bool> updateSongMetadata({
    required String filePath,
    String? title,
    String? artist,
    String? album,
    int? trackNumber,
    int? year,
    String? genre,
  }) async {
    final file = File(filePath);
    if (!file.existsSync()) return false;

    try {
      updateMetadata(file, (metadata) {
        if (title != null) metadata.setTitle(title);
        if (artist != null) metadata.setArtist(artist);
        if (album != null) metadata.setAlbum(album);
        if (trackNumber != null) metadata.setTrackNumber(trackNumber);
        if (year != null) metadata.setYear(DateTime(year));
        if (genre != null) metadata.setGenres([genre]);
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
