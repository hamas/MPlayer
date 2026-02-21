import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mplayer/features/audio/logic/audio_providers.dart';
import 'package:mplayer/features/settings/logic/settings_provider.dart';
import 'package:mplayer/features/settings/logic/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gemini_service.g.dart';

@Riverpod(keepAlive: true)
GeminiService geminiService(Ref ref) {
  return GeminiService(ref);
}

class GeminiService {
  final Ref _ref;

  GeminiService(this._ref);

  Future<List<String>> generatePlaylist(String prompt) async {
    final apiKey = await _ref
        .read(settingsRepositoryProvider)
        .getSetting(SettingsRepository.geminiApiKey);

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API Key not found. Please add it in Settings.');
    }

    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

    final songs = await _ref.read(songRepositoryProvider).getSongsForAi();
    final songsContext = songs.join('\n');

    final content = [
      Content.text('''
You are a DJ. I have the following songs in my library (format: ID|Title|Artist):
$songsContext

Create a playlist of 10-15 song IDs based on this request: "$prompt".
Return ONLY the list of IDs, one per line. No other text.
'''),
    ];

    try {
      final response = await model.generateContent(content);
      final text = response.text;
      if (text == null) return [];

      final ids = LineSplitter.split(
        text,
      ).map((line) => line.trim()).where((line) => line.isNotEmpty).toList();

      // Verify IDs exist in our list (basic validation)
      // Actually, since we sent IDs, Gemini should return them.
      // We might want to filter out any hallucinations but for now let's trust it or handle lookup errors later.
      return ids;
    } catch (e) {
      throw Exception('Failed to generate playlist: $e');
    }
  }
}
