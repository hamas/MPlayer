import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_database.g.dart';

class SongsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get album => text()();
  TextColumn get uri => text()();
  IntColumn get duration => integer().withDefault(const Constant(0))();
  IntColumn get size => integer().withDefault(const Constant(0))();
  TextColumn get artworkUri => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get playCount => integer().withDefault(const Constant(0))();
  IntColumn get skipCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get dateAdded => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlaylistsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PlaylistSongsTable extends Table {
  IntColumn get playlistId => integer().references(PlaylistsTable, #id)();
  TextColumn get songId => text().references(SongsTable, #id)();
  IntColumn get orderIndex => integer()(); // For ordering songs in playlist

  @override
  Set<Column> get primaryKey => {playlistId, songId};
}

class HistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get songId => text().references(SongsTable, #id)();
  DateTimeColumn get datePlayed => dateTime()();
}

class SettingsTable extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class LyricsTable extends Table {
  TextColumn get songId => text()(); // Links to SongsTable.id (path)
  IntColumn get lrclibId => integer()();
  TextColumn get plainLyrics => text().nullable()();
  TextColumn get syncedLyrics => text().nullable()();
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {songId};
}

class ExcludedFoldersTable extends Table {
  TextColumn get path => text()();

  @override
  Set<Column> get primaryKey => {path};
}

class CloudSongsTable extends Table {
  TextColumn get id => text()(); // YouTube VideoID
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get album => text().withDefault(const Constant('YouTube Music'))();
  TextColumn get thumbnailUri => text().nullable()();
  IntColumn get duration => integer().withDefault(const Constant(0))();
  DateTimeColumn get dateAdded => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    SongsTable,
    PlaylistsTable,
    PlaylistSongsTable,
    HistoryTable,
    SettingsTable,
    LyricsTable,
    ExcludedFoldersTable,
    CloudSongsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(cloudSongsTable);
        }
        if (from < 3) {
          await m.addColumn(songsTable, songsTable.skipCount);
        }
      },
    );
  }
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mplayer_db.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      logStatements: false,
      setup: (rawDb) {
        // WAL mode: allows concurrent reads while writing (critical for 10k+ songs)
        rawDb.execute('PRAGMA journal_mode=WAL;');
        // NORMAL sync: safe and much faster than FULL
        rawDb.execute('PRAGMA synchronous=NORMAL;');
        // Larger cache = faster queries on big libraries
        rawDb.execute('PRAGMA cache_size=-20000;'); // ~20MB cache
      },
    );
  });
}
