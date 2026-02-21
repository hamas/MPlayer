import 'package:mplayer/core/database/app_database.dart';
import 'package:drift/drift.dart';

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Future<void> saveSetting(String key, String value) async {
    await _db
        .into(_db.settingsTable)
        .insertOnConflictUpdate(
          SettingsTableCompanion(key: Value(key), value: Value(value)),
        );
  }

  Future<String?> getSetting(String key) async {
    final query = _db.select(_db.settingsTable)
      ..where((t) => t.key.equals(key));
    final result = await query.getSingleOrNull();
    return result?.value;
  }

  Stream<String?> watchSetting(String key) {
    final query = _db.select(_db.settingsTable)
      ..where((t) => t.key.equals(key));
    return query.watchSingleOrNull().map((row) => row?.value);
  }

  // Keys
  static const String geminiApiKey = 'gemini_api_key';
  static const String serverEnabled = 'server_enabled';
}
