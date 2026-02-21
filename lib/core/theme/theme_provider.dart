import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';

final dynamicColorSchemeProvider = StreamProvider<ColorScheme?>((ref) async* {
  final handler = await ref.watch(audioHandlerProvider.future);

  await for (final mediaItem in handler.mediaItem) {
    if (mediaItem == null || mediaItem.artUri == null) {
      yield null;
      continue;
    }

    try {
      final uri = mediaItem.artUri!;
      ImageProvider imageProvider;
      if (uri.scheme == 'file') {
        imageProvider = FileImage(File(uri.toFilePath()));
      } else {
        imageProvider = NetworkImage(uri.toString());
      }

      final palette = await PaletteGenerator.fromImageProvider(imageProvider);

      if (palette.dominantColor != null) {
        yield ColorScheme.fromSeed(seedColor: palette.dominantColor!.color);
      } else if (palette.mutedColor != null) {
        yield ColorScheme.fromSeed(seedColor: palette.mutedColor!.color);
      } else {
        yield null;
      }
    } catch (e) {
      yield null;
    }
  }
});
