import 'package:mplayer/core/database/app_database.dart';
// Actually app_database.dart usually has the provider or we need to find where it is.
// Checking logs: "riverpod_generator on ... app_database.dart"
// So there likely is a provider in app_database.g.dart
import 'package:mplayer/features/settings/logic/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingsRepository(db);
}

@riverpod
Stream<String?> geminiApiKey(Ref ref) {
  return ref
      .watch(settingsRepositoryProvider)
      .watchSetting(SettingsRepository.geminiApiKey);
}
