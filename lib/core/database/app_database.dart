import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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
  DateTimeColumn get playedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [SongsTable, PlaylistsTable, PlaylistSongsTable, HistoryTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mplayer_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
