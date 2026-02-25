// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SongsTableTable extends SongsTable
    with TableInfo<$SongsTableTable, SongsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uriMeta = const VerificationMeta('uri');
  @override
  late final GeneratedColumn<String> uri = GeneratedColumn<String>(
    'uri',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _artworkUriMeta = const VerificationMeta(
    'artworkUri',
  );
  @override
  late final GeneratedColumn<String> artworkUri = GeneratedColumn<String>(
    'artwork_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _playCountMeta = const VerificationMeta(
    'playCount',
  );
  @override
  late final GeneratedColumn<int> playCount = GeneratedColumn<int>(
    'play_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _skipCountMeta = const VerificationMeta(
    'skipCount',
  );
  @override
  late final GeneratedColumn<int> skipCount = GeneratedColumn<int>(
    'skip_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    artist,
    album,
    uri,
    duration,
    size,
    artworkUri,
    isFavorite,
    playCount,
    skipCount,
    dateAdded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SongsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    } else if (isInserting) {
      context.missing(_albumMeta);
    }
    if (data.containsKey('uri')) {
      context.handle(
        _uriMeta,
        uri.isAcceptableOrUnknown(data['uri']!, _uriMeta),
      );
    } else if (isInserting) {
      context.missing(_uriMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('artwork_uri')) {
      context.handle(
        _artworkUriMeta,
        artworkUri.isAcceptableOrUnknown(data['artwork_uri']!, _artworkUriMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('play_count')) {
      context.handle(
        _playCountMeta,
        playCount.isAcceptableOrUnknown(data['play_count']!, _playCountMeta),
      );
    }
    if (data.containsKey('skip_count')) {
      context.handle(
        _skipCountMeta,
        skipCount.isAcceptableOrUnknown(data['skip_count']!, _skipCountMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      )!,
      uri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uri'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      artworkUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artwork_uri'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      playCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}play_count'],
      )!,
      skipCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skip_count'],
      )!,
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      ),
    );
  }

  @override
  $SongsTableTable createAlias(String alias) {
    return $SongsTableTable(attachedDatabase, alias);
  }
}

class SongsTableData extends DataClass implements Insertable<SongsTableData> {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String uri;
  final int duration;
  final int size;
  final String? artworkUri;
  final bool isFavorite;
  final int playCount;
  final int skipCount;
  final DateTime? dateAdded;
  const SongsTableData({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.uri,
    required this.duration,
    required this.size,
    this.artworkUri,
    required this.isFavorite,
    required this.playCount,
    required this.skipCount,
    this.dateAdded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['album'] = Variable<String>(album);
    map['uri'] = Variable<String>(uri);
    map['duration'] = Variable<int>(duration);
    map['size'] = Variable<int>(size);
    if (!nullToAbsent || artworkUri != null) {
      map['artwork_uri'] = Variable<String>(artworkUri);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['play_count'] = Variable<int>(playCount);
    map['skip_count'] = Variable<int>(skipCount);
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    return map;
  }

  SongsTableCompanion toCompanion(bool nullToAbsent) {
    return SongsTableCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      album: Value(album),
      uri: Value(uri),
      duration: Value(duration),
      size: Value(size),
      artworkUri: artworkUri == null && nullToAbsent
          ? const Value.absent()
          : Value(artworkUri),
      isFavorite: Value(isFavorite),
      playCount: Value(playCount),
      skipCount: Value(skipCount),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
    );
  }

  factory SongsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      album: serializer.fromJson<String>(json['album']),
      uri: serializer.fromJson<String>(json['uri']),
      duration: serializer.fromJson<int>(json['duration']),
      size: serializer.fromJson<int>(json['size']),
      artworkUri: serializer.fromJson<String?>(json['artworkUri']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      playCount: serializer.fromJson<int>(json['playCount']),
      skipCount: serializer.fromJson<int>(json['skipCount']),
      dateAdded: serializer.fromJson<DateTime?>(json['dateAdded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'album': serializer.toJson<String>(album),
      'uri': serializer.toJson<String>(uri),
      'duration': serializer.toJson<int>(duration),
      'size': serializer.toJson<int>(size),
      'artworkUri': serializer.toJson<String?>(artworkUri),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'playCount': serializer.toJson<int>(playCount),
      'skipCount': serializer.toJson<int>(skipCount),
      'dateAdded': serializer.toJson<DateTime?>(dateAdded),
    };
  }

  SongsTableData copyWith({
    String? id,
    String? title,
    String? artist,
    String? album,
    String? uri,
    int? duration,
    int? size,
    Value<String?> artworkUri = const Value.absent(),
    bool? isFavorite,
    int? playCount,
    int? skipCount,
    Value<DateTime?> dateAdded = const Value.absent(),
  }) => SongsTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    artist: artist ?? this.artist,
    album: album ?? this.album,
    uri: uri ?? this.uri,
    duration: duration ?? this.duration,
    size: size ?? this.size,
    artworkUri: artworkUri.present ? artworkUri.value : this.artworkUri,
    isFavorite: isFavorite ?? this.isFavorite,
    playCount: playCount ?? this.playCount,
    skipCount: skipCount ?? this.skipCount,
    dateAdded: dateAdded.present ? dateAdded.value : this.dateAdded,
  );
  SongsTableData copyWithCompanion(SongsTableCompanion data) {
    return SongsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      album: data.album.present ? data.album.value : this.album,
      uri: data.uri.present ? data.uri.value : this.uri,
      duration: data.duration.present ? data.duration.value : this.duration,
      size: data.size.present ? data.size.value : this.size,
      artworkUri: data.artworkUri.present
          ? data.artworkUri.value
          : this.artworkUri,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      playCount: data.playCount.present ? data.playCount.value : this.playCount,
      skipCount: data.skipCount.present ? data.skipCount.value : this.skipCount,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SongsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('uri: $uri, ')
          ..write('duration: $duration, ')
          ..write('size: $size, ')
          ..write('artworkUri: $artworkUri, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('playCount: $playCount, ')
          ..write('skipCount: $skipCount, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    artist,
    album,
    uri,
    duration,
    size,
    artworkUri,
    isFavorite,
    playCount,
    skipCount,
    dateAdded,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.album == this.album &&
          other.uri == this.uri &&
          other.duration == this.duration &&
          other.size == this.size &&
          other.artworkUri == this.artworkUri &&
          other.isFavorite == this.isFavorite &&
          other.playCount == this.playCount &&
          other.skipCount == this.skipCount &&
          other.dateAdded == this.dateAdded);
}

class SongsTableCompanion extends UpdateCompanion<SongsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> album;
  final Value<String> uri;
  final Value<int> duration;
  final Value<int> size;
  final Value<String?> artworkUri;
  final Value<bool> isFavorite;
  final Value<int> playCount;
  final Value<int> skipCount;
  final Value<DateTime?> dateAdded;
  final Value<int> rowid;
  const SongsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.album = const Value.absent(),
    this.uri = const Value.absent(),
    this.duration = const Value.absent(),
    this.size = const Value.absent(),
    this.artworkUri = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.playCount = const Value.absent(),
    this.skipCount = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SongsTableCompanion.insert({
    required String id,
    required String title,
    required String artist,
    required String album,
    required String uri,
    this.duration = const Value.absent(),
    this.size = const Value.absent(),
    this.artworkUri = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.playCount = const Value.absent(),
    this.skipCount = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       artist = Value(artist),
       album = Value(album),
       uri = Value(uri);
  static Insertable<SongsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? album,
    Expression<String>? uri,
    Expression<int>? duration,
    Expression<int>? size,
    Expression<String>? artworkUri,
    Expression<bool>? isFavorite,
    Expression<int>? playCount,
    Expression<int>? skipCount,
    Expression<DateTime>? dateAdded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (album != null) 'album': album,
      if (uri != null) 'uri': uri,
      if (duration != null) 'duration': duration,
      if (size != null) 'size': size,
      if (artworkUri != null) 'artwork_uri': artworkUri,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (playCount != null) 'play_count': playCount,
      if (skipCount != null) 'skip_count': skipCount,
      if (dateAdded != null) 'date_added': dateAdded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SongsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? artist,
    Value<String>? album,
    Value<String>? uri,
    Value<int>? duration,
    Value<int>? size,
    Value<String?>? artworkUri,
    Value<bool>? isFavorite,
    Value<int>? playCount,
    Value<int>? skipCount,
    Value<DateTime?>? dateAdded,
    Value<int>? rowid,
  }) {
    return SongsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      uri: uri ?? this.uri,
      duration: duration ?? this.duration,
      size: size ?? this.size,
      artworkUri: artworkUri ?? this.artworkUri,
      isFavorite: isFavorite ?? this.isFavorite,
      playCount: playCount ?? this.playCount,
      skipCount: skipCount ?? this.skipCount,
      dateAdded: dateAdded ?? this.dateAdded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (uri.present) {
      map['uri'] = Variable<String>(uri.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (artworkUri.present) {
      map['artwork_uri'] = Variable<String>(artworkUri.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (playCount.present) {
      map['play_count'] = Variable<int>(playCount.value);
    }
    if (skipCount.present) {
      map['skip_count'] = Variable<int>(skipCount.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('uri: $uri, ')
          ..write('duration: $duration, ')
          ..write('size: $size, ')
          ..write('artworkUri: $artworkUri, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('playCount: $playCount, ')
          ..write('skipCount: $skipCount, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaylistsTableTable extends PlaylistsTable
    with TableInfo<$PlaylistsTableTable, PlaylistsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlists_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaylistsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlaylistsTableTable createAlias(String alias) {
    return $PlaylistsTableTable(attachedDatabase, alias);
  }
}

class PlaylistsTableData extends DataClass
    implements Insertable<PlaylistsTableData> {
  final int id;
  final String name;
  final DateTime createdAt;
  const PlaylistsTableData({
    required this.id,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlaylistsTableCompanion toCompanion(bool nullToAbsent) {
    return PlaylistsTableCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory PlaylistsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlaylistsTableData copyWith({int? id, String? name, DateTime? createdAt}) =>
      PlaylistsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  PlaylistsTableData copyWithCompanion(PlaylistsTableCompanion data) {
    return PlaylistsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class PlaylistsTableCompanion extends UpdateCompanion<PlaylistsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const PlaylistsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlaylistsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PlaylistsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlaylistsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return PlaylistsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlaylistSongsTableTable extends PlaylistSongsTable
    with TableInfo<$PlaylistSongsTableTable, PlaylistSongsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaylistSongsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playlistIdMeta = const VerificationMeta(
    'playlistId',
  );
  @override
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
    'playlist_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES playlists_table (id)',
    ),
  );
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES songs_table (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [playlistId, songId, orderIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist_songs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaylistSongsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('playlist_id')) {
      context.handle(
        _playlistIdMeta,
        playlistId.isAcceptableOrUnknown(data['playlist_id']!, _playlistIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playlistId, songId};
  @override
  PlaylistSongsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistSongsTableData(
      playlistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}playlist_id'],
      )!,
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}song_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $PlaylistSongsTableTable createAlias(String alias) {
    return $PlaylistSongsTableTable(attachedDatabase, alias);
  }
}

class PlaylistSongsTableData extends DataClass
    implements Insertable<PlaylistSongsTableData> {
  final int playlistId;
  final String songId;
  final int orderIndex;
  const PlaylistSongsTableData({
    required this.playlistId,
    required this.songId,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['playlist_id'] = Variable<int>(playlistId);
    map['song_id'] = Variable<String>(songId);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  PlaylistSongsTableCompanion toCompanion(bool nullToAbsent) {
    return PlaylistSongsTableCompanion(
      playlistId: Value(playlistId),
      songId: Value(songId),
      orderIndex: Value(orderIndex),
    );
  }

  factory PlaylistSongsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistSongsTableData(
      playlistId: serializer.fromJson<int>(json['playlistId']),
      songId: serializer.fromJson<String>(json['songId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playlistId': serializer.toJson<int>(playlistId),
      'songId': serializer.toJson<String>(songId),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  PlaylistSongsTableData copyWith({
    int? playlistId,
    String? songId,
    int? orderIndex,
  }) => PlaylistSongsTableData(
    playlistId: playlistId ?? this.playlistId,
    songId: songId ?? this.songId,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  PlaylistSongsTableData copyWithCompanion(PlaylistSongsTableCompanion data) {
    return PlaylistSongsTableData(
      playlistId: data.playlistId.present
          ? data.playlistId.value
          : this.playlistId,
      songId: data.songId.present ? data.songId.value : this.songId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistSongsTableData(')
          ..write('playlistId: $playlistId, ')
          ..write('songId: $songId, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(playlistId, songId, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistSongsTableData &&
          other.playlistId == this.playlistId &&
          other.songId == this.songId &&
          other.orderIndex == this.orderIndex);
}

class PlaylistSongsTableCompanion
    extends UpdateCompanion<PlaylistSongsTableData> {
  final Value<int> playlistId;
  final Value<String> songId;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const PlaylistSongsTableCompanion({
    this.playlistId = const Value.absent(),
    this.songId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistSongsTableCompanion.insert({
    required int playlistId,
    required String songId,
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : playlistId = Value(playlistId),
       songId = Value(songId),
       orderIndex = Value(orderIndex);
  static Insertable<PlaylistSongsTableData> custom({
    Expression<int>? playlistId,
    Expression<String>? songId,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playlistId != null) 'playlist_id': playlistId,
      if (songId != null) 'song_id': songId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistSongsTableCompanion copyWith({
    Value<int>? playlistId,
    Value<String>? songId,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return PlaylistSongsTableCompanion(
      playlistId: playlistId ?? this.playlistId,
      songId: songId ?? this.songId,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistSongsTableCompanion(')
          ..write('playlistId: $playlistId, ')
          ..write('songId: $songId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES songs_table (id)',
    ),
  );
  static const VerificationMeta _datePlayedMeta = const VerificationMeta(
    'datePlayed',
  );
  @override
  late final GeneratedColumn<DateTime> datePlayed = GeneratedColumn<DateTime>(
    'date_played',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, songId, datePlayed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('date_played')) {
      context.handle(
        _datePlayedMeta,
        datePlayed.isAcceptableOrUnknown(data['date_played']!, _datePlayedMeta),
      );
    } else if (isInserting) {
      context.missing(_datePlayedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}song_id'],
      )!,
      datePlayed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_played'],
      )!,
    );
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(attachedDatabase, alias);
  }
}

class HistoryTableData extends DataClass
    implements Insertable<HistoryTableData> {
  final int id;
  final String songId;
  final DateTime datePlayed;
  const HistoryTableData({
    required this.id,
    required this.songId,
    required this.datePlayed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<String>(songId);
    map['date_played'] = Variable<DateTime>(datePlayed);
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: Value(id),
      songId: Value(songId),
      datePlayed: Value(datePlayed),
    );
  }

  factory HistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      songId: serializer.fromJson<String>(json['songId']),
      datePlayed: serializer.fromJson<DateTime>(json['datePlayed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'songId': serializer.toJson<String>(songId),
      'datePlayed': serializer.toJson<DateTime>(datePlayed),
    };
  }

  HistoryTableData copyWith({int? id, String? songId, DateTime? datePlayed}) =>
      HistoryTableData(
        id: id ?? this.id,
        songId: songId ?? this.songId,
        datePlayed: datePlayed ?? this.datePlayed,
      );
  HistoryTableData copyWithCompanion(HistoryTableCompanion data) {
    return HistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      songId: data.songId.present ? data.songId.value : this.songId,
      datePlayed: data.datePlayed.present
          ? data.datePlayed.value
          : this.datePlayed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableData(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('datePlayed: $datePlayed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, songId, datePlayed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryTableData &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.datePlayed == this.datePlayed);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryTableData> {
  final Value<int> id;
  final Value<String> songId;
  final Value<DateTime> datePlayed;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.datePlayed = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String songId,
    required DateTime datePlayed,
  }) : songId = Value(songId),
       datePlayed = Value(datePlayed);
  static Insertable<HistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? songId,
    Expression<DateTime>? datePlayed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (datePlayed != null) 'date_played': datePlayed,
    });
  }

  HistoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? songId,
    Value<DateTime>? datePlayed,
  }) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      datePlayed: datePlayed ?? this.datePlayed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (datePlayed.present) {
      map['date_played'] = Variable<DateTime>(datePlayed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('datePlayed: $datePlayed')
          ..write(')'))
        .toString();
  }
}

class $SettingsTableTable extends SettingsTable
    with TableInfo<$SettingsTableTable, SettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsTableData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTableTable createAlias(String alias) {
    return $SettingsTableTable(attachedDatabase, alias);
  }
}

class SettingsTableData extends DataClass
    implements Insertable<SettingsTableData> {
  final String key;
  final String value;
  const SettingsTableData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsTableCompanion toCompanion(bool nullToAbsent) {
    return SettingsTableCompanion(key: Value(key), value: Value(value));
  }

  factory SettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsTableData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingsTableData copyWith({String? key, String? value}) =>
      SettingsTableData(key: key ?? this.key, value: value ?? this.value);
  SettingsTableData copyWithCompanion(SettingsTableCompanion data) {
    return SettingsTableData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsTableData &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsTableCompanion extends UpdateCompanion<SettingsTableData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsTableCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsTableCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SettingsTableData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsTableCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsTableCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LyricsTableTable extends LyricsTable
    with TableInfo<$LyricsTableTable, LyricsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LyricsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lrclibIdMeta = const VerificationMeta(
    'lrclibId',
  );
  @override
  late final GeneratedColumn<int> lrclibId = GeneratedColumn<int>(
    'lrclib_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plainLyricsMeta = const VerificationMeta(
    'plainLyrics',
  );
  @override
  late final GeneratedColumn<String> plainLyrics = GeneratedColumn<String>(
    'plain_lyrics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedLyricsMeta = const VerificationMeta(
    'syncedLyrics',
  );
  @override
  late final GeneratedColumn<String> syncedLyrics = GeneratedColumn<String>(
    'synced_lyrics',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    songId,
    lrclibId,
    plainLyrics,
    syncedLyrics,
    savedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lyrics_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LyricsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('lrclib_id')) {
      context.handle(
        _lrclibIdMeta,
        lrclibId.isAcceptableOrUnknown(data['lrclib_id']!, _lrclibIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lrclibIdMeta);
    }
    if (data.containsKey('plain_lyrics')) {
      context.handle(
        _plainLyricsMeta,
        plainLyrics.isAcceptableOrUnknown(
          data['plain_lyrics']!,
          _plainLyricsMeta,
        ),
      );
    }
    if (data.containsKey('synced_lyrics')) {
      context.handle(
        _syncedLyricsMeta,
        syncedLyrics.isAcceptableOrUnknown(
          data['synced_lyrics']!,
          _syncedLyricsMeta,
        ),
      );
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {songId};
  @override
  LyricsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LyricsTableData(
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}song_id'],
      )!,
      lrclibId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lrclib_id'],
      )!,
      plainLyrics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plain_lyrics'],
      ),
      syncedLyrics: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}synced_lyrics'],
      ),
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $LyricsTableTable createAlias(String alias) {
    return $LyricsTableTable(attachedDatabase, alias);
  }
}

class LyricsTableData extends DataClass implements Insertable<LyricsTableData> {
  final String songId;
  final int lrclibId;
  final String? plainLyrics;
  final String? syncedLyrics;
  final DateTime savedAt;
  const LyricsTableData({
    required this.songId,
    required this.lrclibId,
    this.plainLyrics,
    this.syncedLyrics,
    required this.savedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['song_id'] = Variable<String>(songId);
    map['lrclib_id'] = Variable<int>(lrclibId);
    if (!nullToAbsent || plainLyrics != null) {
      map['plain_lyrics'] = Variable<String>(plainLyrics);
    }
    if (!nullToAbsent || syncedLyrics != null) {
      map['synced_lyrics'] = Variable<String>(syncedLyrics);
    }
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  LyricsTableCompanion toCompanion(bool nullToAbsent) {
    return LyricsTableCompanion(
      songId: Value(songId),
      lrclibId: Value(lrclibId),
      plainLyrics: plainLyrics == null && nullToAbsent
          ? const Value.absent()
          : Value(plainLyrics),
      syncedLyrics: syncedLyrics == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedLyrics),
      savedAt: Value(savedAt),
    );
  }

  factory LyricsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LyricsTableData(
      songId: serializer.fromJson<String>(json['songId']),
      lrclibId: serializer.fromJson<int>(json['lrclibId']),
      plainLyrics: serializer.fromJson<String?>(json['plainLyrics']),
      syncedLyrics: serializer.fromJson<String?>(json['syncedLyrics']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'songId': serializer.toJson<String>(songId),
      'lrclibId': serializer.toJson<int>(lrclibId),
      'plainLyrics': serializer.toJson<String?>(plainLyrics),
      'syncedLyrics': serializer.toJson<String?>(syncedLyrics),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  LyricsTableData copyWith({
    String? songId,
    int? lrclibId,
    Value<String?> plainLyrics = const Value.absent(),
    Value<String?> syncedLyrics = const Value.absent(),
    DateTime? savedAt,
  }) => LyricsTableData(
    songId: songId ?? this.songId,
    lrclibId: lrclibId ?? this.lrclibId,
    plainLyrics: plainLyrics.present ? plainLyrics.value : this.plainLyrics,
    syncedLyrics: syncedLyrics.present ? syncedLyrics.value : this.syncedLyrics,
    savedAt: savedAt ?? this.savedAt,
  );
  LyricsTableData copyWithCompanion(LyricsTableCompanion data) {
    return LyricsTableData(
      songId: data.songId.present ? data.songId.value : this.songId,
      lrclibId: data.lrclibId.present ? data.lrclibId.value : this.lrclibId,
      plainLyrics: data.plainLyrics.present
          ? data.plainLyrics.value
          : this.plainLyrics,
      syncedLyrics: data.syncedLyrics.present
          ? data.syncedLyrics.value
          : this.syncedLyrics,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LyricsTableData(')
          ..write('songId: $songId, ')
          ..write('lrclibId: $lrclibId, ')
          ..write('plainLyrics: $plainLyrics, ')
          ..write('syncedLyrics: $syncedLyrics, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(songId, lrclibId, plainLyrics, syncedLyrics, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LyricsTableData &&
          other.songId == this.songId &&
          other.lrclibId == this.lrclibId &&
          other.plainLyrics == this.plainLyrics &&
          other.syncedLyrics == this.syncedLyrics &&
          other.savedAt == this.savedAt);
}

class LyricsTableCompanion extends UpdateCompanion<LyricsTableData> {
  final Value<String> songId;
  final Value<int> lrclibId;
  final Value<String?> plainLyrics;
  final Value<String?> syncedLyrics;
  final Value<DateTime> savedAt;
  final Value<int> rowid;
  const LyricsTableCompanion({
    this.songId = const Value.absent(),
    this.lrclibId = const Value.absent(),
    this.plainLyrics = const Value.absent(),
    this.syncedLyrics = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LyricsTableCompanion.insert({
    required String songId,
    required int lrclibId,
    this.plainLyrics = const Value.absent(),
    this.syncedLyrics = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : songId = Value(songId),
       lrclibId = Value(lrclibId);
  static Insertable<LyricsTableData> custom({
    Expression<String>? songId,
    Expression<int>? lrclibId,
    Expression<String>? plainLyrics,
    Expression<String>? syncedLyrics,
    Expression<DateTime>? savedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (songId != null) 'song_id': songId,
      if (lrclibId != null) 'lrclib_id': lrclibId,
      if (plainLyrics != null) 'plain_lyrics': plainLyrics,
      if (syncedLyrics != null) 'synced_lyrics': syncedLyrics,
      if (savedAt != null) 'saved_at': savedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LyricsTableCompanion copyWith({
    Value<String>? songId,
    Value<int>? lrclibId,
    Value<String?>? plainLyrics,
    Value<String?>? syncedLyrics,
    Value<DateTime>? savedAt,
    Value<int>? rowid,
  }) {
    return LyricsTableCompanion(
      songId: songId ?? this.songId,
      lrclibId: lrclibId ?? this.lrclibId,
      plainLyrics: plainLyrics ?? this.plainLyrics,
      syncedLyrics: syncedLyrics ?? this.syncedLyrics,
      savedAt: savedAt ?? this.savedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (lrclibId.present) {
      map['lrclib_id'] = Variable<int>(lrclibId.value);
    }
    if (plainLyrics.present) {
      map['plain_lyrics'] = Variable<String>(plainLyrics.value);
    }
    if (syncedLyrics.present) {
      map['synced_lyrics'] = Variable<String>(syncedLyrics.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LyricsTableCompanion(')
          ..write('songId: $songId, ')
          ..write('lrclibId: $lrclibId, ')
          ..write('plainLyrics: $plainLyrics, ')
          ..write('syncedLyrics: $syncedLyrics, ')
          ..write('savedAt: $savedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExcludedFoldersTableTable extends ExcludedFoldersTable
    with TableInfo<$ExcludedFoldersTableTable, ExcludedFoldersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExcludedFoldersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [path];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'excluded_folders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExcludedFoldersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {path};
  @override
  ExcludedFoldersTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExcludedFoldersTableData(
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
    );
  }

  @override
  $ExcludedFoldersTableTable createAlias(String alias) {
    return $ExcludedFoldersTableTable(attachedDatabase, alias);
  }
}

class ExcludedFoldersTableData extends DataClass
    implements Insertable<ExcludedFoldersTableData> {
  final String path;
  const ExcludedFoldersTableData({required this.path});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['path'] = Variable<String>(path);
    return map;
  }

  ExcludedFoldersTableCompanion toCompanion(bool nullToAbsent) {
    return ExcludedFoldersTableCompanion(path: Value(path));
  }

  factory ExcludedFoldersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExcludedFoldersTableData(
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'path': serializer.toJson<String>(path)};
  }

  ExcludedFoldersTableData copyWith({String? path}) =>
      ExcludedFoldersTableData(path: path ?? this.path);
  ExcludedFoldersTableData copyWithCompanion(
    ExcludedFoldersTableCompanion data,
  ) {
    return ExcludedFoldersTableData(
      path: data.path.present ? data.path.value : this.path,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExcludedFoldersTableData(')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => path.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExcludedFoldersTableData && other.path == this.path);
}

class ExcludedFoldersTableCompanion
    extends UpdateCompanion<ExcludedFoldersTableData> {
  final Value<String> path;
  final Value<int> rowid;
  const ExcludedFoldersTableCompanion({
    this.path = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExcludedFoldersTableCompanion.insert({
    required String path,
    this.rowid = const Value.absent(),
  }) : path = Value(path);
  static Insertable<ExcludedFoldersTableData> custom({
    Expression<String>? path,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (path != null) 'path': path,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExcludedFoldersTableCompanion copyWith({
    Value<String>? path,
    Value<int>? rowid,
  }) {
    return ExcludedFoldersTableCompanion(
      path: path ?? this.path,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExcludedFoldersTableCompanion(')
          ..write('path: $path, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CloudSongsTableTable extends CloudSongsTable
    with TableInfo<$CloudSongsTableTable, CloudSongsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CloudSongsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('YouTube Music'),
  );
  static const VerificationMeta _thumbnailUriMeta = const VerificationMeta(
    'thumbnailUri',
  );
  @override
  late final GeneratedColumn<String> thumbnailUri = GeneratedColumn<String>(
    'thumbnail_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    artist,
    album,
    thumbnailUri,
    duration,
    dateAdded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_songs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CloudSongsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    }
    if (data.containsKey('thumbnail_uri')) {
      context.handle(
        _thumbnailUriMeta,
        thumbnailUri.isAcceptableOrUnknown(
          data['thumbnail_uri']!,
          _thumbnailUriMeta,
        ),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CloudSongsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudSongsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      )!,
      thumbnailUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_uri'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      )!,
    );
  }

  @override
  $CloudSongsTableTable createAlias(String alias) {
    return $CloudSongsTableTable(attachedDatabase, alias);
  }
}

class CloudSongsTableData extends DataClass
    implements Insertable<CloudSongsTableData> {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String? thumbnailUri;
  final int duration;
  final DateTime dateAdded;
  const CloudSongsTableData({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    this.thumbnailUri,
    required this.duration,
    required this.dateAdded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['album'] = Variable<String>(album);
    if (!nullToAbsent || thumbnailUri != null) {
      map['thumbnail_uri'] = Variable<String>(thumbnailUri);
    }
    map['duration'] = Variable<int>(duration);
    map['date_added'] = Variable<DateTime>(dateAdded);
    return map;
  }

  CloudSongsTableCompanion toCompanion(bool nullToAbsent) {
    return CloudSongsTableCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      album: Value(album),
      thumbnailUri: thumbnailUri == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUri),
      duration: Value(duration),
      dateAdded: Value(dateAdded),
    );
  }

  factory CloudSongsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudSongsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      album: serializer.fromJson<String>(json['album']),
      thumbnailUri: serializer.fromJson<String?>(json['thumbnailUri']),
      duration: serializer.fromJson<int>(json['duration']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'album': serializer.toJson<String>(album),
      'thumbnailUri': serializer.toJson<String?>(thumbnailUri),
      'duration': serializer.toJson<int>(duration),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
    };
  }

  CloudSongsTableData copyWith({
    String? id,
    String? title,
    String? artist,
    String? album,
    Value<String?> thumbnailUri = const Value.absent(),
    int? duration,
    DateTime? dateAdded,
  }) => CloudSongsTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    artist: artist ?? this.artist,
    album: album ?? this.album,
    thumbnailUri: thumbnailUri.present ? thumbnailUri.value : this.thumbnailUri,
    duration: duration ?? this.duration,
    dateAdded: dateAdded ?? this.dateAdded,
  );
  CloudSongsTableData copyWithCompanion(CloudSongsTableCompanion data) {
    return CloudSongsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      album: data.album.present ? data.album.value : this.album,
      thumbnailUri: data.thumbnailUri.present
          ? data.thumbnailUri.value
          : this.thumbnailUri,
      duration: data.duration.present ? data.duration.value : this.duration,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudSongsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('thumbnailUri: $thumbnailUri, ')
          ..write('duration: $duration, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, artist, album, thumbnailUri, duration, dateAdded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudSongsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.album == this.album &&
          other.thumbnailUri == this.thumbnailUri &&
          other.duration == this.duration &&
          other.dateAdded == this.dateAdded);
}

class CloudSongsTableCompanion extends UpdateCompanion<CloudSongsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<String> album;
  final Value<String?> thumbnailUri;
  final Value<int> duration;
  final Value<DateTime> dateAdded;
  final Value<int> rowid;
  const CloudSongsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.album = const Value.absent(),
    this.thumbnailUri = const Value.absent(),
    this.duration = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudSongsTableCompanion.insert({
    required String id,
    required String title,
    required String artist,
    this.album = const Value.absent(),
    this.thumbnailUri = const Value.absent(),
    this.duration = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       artist = Value(artist);
  static Insertable<CloudSongsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? album,
    Expression<String>? thumbnailUri,
    Expression<int>? duration,
    Expression<DateTime>? dateAdded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (album != null) 'album': album,
      if (thumbnailUri != null) 'thumbnail_uri': thumbnailUri,
      if (duration != null) 'duration': duration,
      if (dateAdded != null) 'date_added': dateAdded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CloudSongsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? artist,
    Value<String>? album,
    Value<String?>? thumbnailUri,
    Value<int>? duration,
    Value<DateTime>? dateAdded,
    Value<int>? rowid,
  }) {
    return CloudSongsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      thumbnailUri: thumbnailUri ?? this.thumbnailUri,
      duration: duration ?? this.duration,
      dateAdded: dateAdded ?? this.dateAdded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (thumbnailUri.present) {
      map['thumbnail_uri'] = Variable<String>(thumbnailUri.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudSongsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('thumbnailUri: $thumbnailUri, ')
          ..write('duration: $duration, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SongsTableTable songsTable = $SongsTableTable(this);
  late final $PlaylistsTableTable playlistsTable = $PlaylistsTableTable(this);
  late final $PlaylistSongsTableTable playlistSongsTable =
      $PlaylistSongsTableTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  late final $LyricsTableTable lyricsTable = $LyricsTableTable(this);
  late final $ExcludedFoldersTableTable excludedFoldersTable =
      $ExcludedFoldersTableTable(this);
  late final $CloudSongsTableTable cloudSongsTable = $CloudSongsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    songsTable,
    playlistsTable,
    playlistSongsTable,
    historyTable,
    settingsTable,
    lyricsTable,
    excludedFoldersTable,
    cloudSongsTable,
  ];
}

typedef $$SongsTableTableCreateCompanionBuilder =
    SongsTableCompanion Function({
      required String id,
      required String title,
      required String artist,
      required String album,
      required String uri,
      Value<int> duration,
      Value<int> size,
      Value<String?> artworkUri,
      Value<bool> isFavorite,
      Value<int> playCount,
      Value<int> skipCount,
      Value<DateTime?> dateAdded,
      Value<int> rowid,
    });
typedef $$SongsTableTableUpdateCompanionBuilder =
    SongsTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> artist,
      Value<String> album,
      Value<String> uri,
      Value<int> duration,
      Value<int> size,
      Value<String?> artworkUri,
      Value<bool> isFavorite,
      Value<int> playCount,
      Value<int> skipCount,
      Value<DateTime?> dateAdded,
      Value<int> rowid,
    });

final class $$SongsTableTableReferences
    extends BaseReferences<_$AppDatabase, $SongsTableTable, SongsTableData> {
  $$SongsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $PlaylistSongsTableTable,
    List<PlaylistSongsTableData>
  >
  _playlistSongsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.playlistSongsTable,
        aliasName: $_aliasNameGenerator(
          db.songsTable.id,
          db.playlistSongsTable.songId,
        ),
      );

  $$PlaylistSongsTableTableProcessedTableManager get playlistSongsTableRefs {
    final manager = $$PlaylistSongsTableTableTableManager(
      $_db,
      $_db.playlistSongsTable,
    ).filter((f) => f.songId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _playlistSongsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HistoryTableTable, List<HistoryTableData>>
  _historyTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.historyTable,
    aliasName: $_aliasNameGenerator(db.songsTable.id, db.historyTable.songId),
  );

  $$HistoryTableTableProcessedTableManager get historyTableRefs {
    final manager = $$HistoryTableTableTableManager(
      $_db,
      $_db.historyTable,
    ).filter((f) => f.songId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_historyTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SongsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SongsTableTable> {
  $$SongsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uri => $composableBuilder(
    column: $table.uri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artworkUri => $composableBuilder(
    column: $table.artworkUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playCount => $composableBuilder(
    column: $table.playCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skipCount => $composableBuilder(
    column: $table.skipCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> playlistSongsTableRefs(
    Expression<bool> Function($$PlaylistSongsTableTableFilterComposer f) f,
  ) {
    final $$PlaylistSongsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistSongsTable,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistSongsTableTableFilterComposer(
            $db: $db,
            $table: $db.playlistSongsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> historyTableRefs(
    Expression<bool> Function($$HistoryTableTableFilterComposer f) f,
  ) {
    final $$HistoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableFilterComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SongsTableTable> {
  $$SongsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uri => $composableBuilder(
    column: $table.uri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artworkUri => $composableBuilder(
    column: $table.artworkUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playCount => $composableBuilder(
    column: $table.playCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skipCount => $composableBuilder(
    column: $table.skipCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SongsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SongsTableTable> {
  $$SongsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get uri =>
      $composableBuilder(column: $table.uri, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get artworkUri => $composableBuilder(
    column: $table.artworkUri,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get playCount =>
      $composableBuilder(column: $table.playCount, builder: (column) => column);

  GeneratedColumn<int> get skipCount =>
      $composableBuilder(column: $table.skipCount, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  Expression<T> playlistSongsTableRefs<T extends Object>(
    Expression<T> Function($$PlaylistSongsTableTableAnnotationComposer a) f,
  ) {
    final $$PlaylistSongsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.playlistSongsTable,
          getReferencedColumn: (t) => t.songId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PlaylistSongsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.playlistSongsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> historyTableRefs<T extends Object>(
    Expression<T> Function($$HistoryTableTableAnnotationComposer a) f,
  ) {
    final $$HistoryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historyTable,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.historyTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SongsTableTable,
          SongsTableData,
          $$SongsTableTableFilterComposer,
          $$SongsTableTableOrderingComposer,
          $$SongsTableTableAnnotationComposer,
          $$SongsTableTableCreateCompanionBuilder,
          $$SongsTableTableUpdateCompanionBuilder,
          (SongsTableData, $$SongsTableTableReferences),
          SongsTableData,
          PrefetchHooks Function({
            bool playlistSongsTableRefs,
            bool historyTableRefs,
          })
        > {
  $$SongsTableTableTableManager(_$AppDatabase db, $SongsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<String> album = const Value.absent(),
                Value<String> uri = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<String?> artworkUri = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> playCount = const Value.absent(),
                Value<int> skipCount = const Value.absent(),
                Value<DateTime?> dateAdded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SongsTableCompanion(
                id: id,
                title: title,
                artist: artist,
                album: album,
                uri: uri,
                duration: duration,
                size: size,
                artworkUri: artworkUri,
                isFavorite: isFavorite,
                playCount: playCount,
                skipCount: skipCount,
                dateAdded: dateAdded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String artist,
                required String album,
                required String uri,
                Value<int> duration = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<String?> artworkUri = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> playCount = const Value.absent(),
                Value<int> skipCount = const Value.absent(),
                Value<DateTime?> dateAdded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SongsTableCompanion.insert(
                id: id,
                title: title,
                artist: artist,
                album: album,
                uri: uri,
                duration: duration,
                size: size,
                artworkUri: artworkUri,
                isFavorite: isFavorite,
                playCount: playCount,
                skipCount: skipCount,
                dateAdded: dateAdded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SongsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playlistSongsTableRefs = false, historyTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playlistSongsTableRefs) db.playlistSongsTable,
                    if (historyTableRefs) db.historyTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playlistSongsTableRefs)
                        await $_getPrefetchedData<
                          SongsTableData,
                          $SongsTableTable,
                          PlaylistSongsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SongsTableTableReferences
                              ._playlistSongsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SongsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).playlistSongsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.songId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (historyTableRefs)
                        await $_getPrefetchedData<
                          SongsTableData,
                          $SongsTableTable,
                          HistoryTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SongsTableTableReferences
                              ._historyTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SongsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).historyTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.songId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SongsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SongsTableTable,
      SongsTableData,
      $$SongsTableTableFilterComposer,
      $$SongsTableTableOrderingComposer,
      $$SongsTableTableAnnotationComposer,
      $$SongsTableTableCreateCompanionBuilder,
      $$SongsTableTableUpdateCompanionBuilder,
      (SongsTableData, $$SongsTableTableReferences),
      SongsTableData,
      PrefetchHooks Function({
        bool playlistSongsTableRefs,
        bool historyTableRefs,
      })
    >;
typedef $$PlaylistsTableTableCreateCompanionBuilder =
    PlaylistsTableCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
    });
typedef $$PlaylistsTableTableUpdateCompanionBuilder =
    PlaylistsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
    });

final class $$PlaylistsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PlaylistsTableTable,
          PlaylistsTableData
        > {
  $$PlaylistsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $PlaylistSongsTableTable,
    List<PlaylistSongsTableData>
  >
  _playlistSongsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.playlistSongsTable,
        aliasName: $_aliasNameGenerator(
          db.playlistsTable.id,
          db.playlistSongsTable.playlistId,
        ),
      );

  $$PlaylistSongsTableTableProcessedTableManager get playlistSongsTableRefs {
    final manager = $$PlaylistSongsTableTableTableManager(
      $_db,
      $_db.playlistSongsTable,
    ).filter((f) => f.playlistId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _playlistSongsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaylistsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistsTableTable> {
  $$PlaylistsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> playlistSongsTableRefs(
    Expression<bool> Function($$PlaylistSongsTableTableFilterComposer f) f,
  ) {
    final $$PlaylistSongsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playlistSongsTable,
      getReferencedColumn: (t) => t.playlistId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistSongsTableTableFilterComposer(
            $db: $db,
            $table: $db.playlistSongsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaylistsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistsTableTable> {
  $$PlaylistsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlaylistsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistsTableTable> {
  $$PlaylistsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> playlistSongsTableRefs<T extends Object>(
    Expression<T> Function($$PlaylistSongsTableTableAnnotationComposer a) f,
  ) {
    final $$PlaylistSongsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.playlistSongsTable,
          getReferencedColumn: (t) => t.playlistId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PlaylistSongsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.playlistSongsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PlaylistsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistsTableTable,
          PlaylistsTableData,
          $$PlaylistsTableTableFilterComposer,
          $$PlaylistsTableTableOrderingComposer,
          $$PlaylistsTableTableAnnotationComposer,
          $$PlaylistsTableTableCreateCompanionBuilder,
          $$PlaylistsTableTableUpdateCompanionBuilder,
          (PlaylistsTableData, $$PlaylistsTableTableReferences),
          PlaylistsTableData,
          PrefetchHooks Function({bool playlistSongsTableRefs})
        > {
  $$PlaylistsTableTableTableManager(
    _$AppDatabase db,
    $PlaylistsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistsTableCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlaylistsTableCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistSongsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playlistSongsTableRefs) db.playlistSongsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playlistSongsTableRefs)
                    await $_getPrefetchedData<
                      PlaylistsTableData,
                      $PlaylistsTableTable,
                      PlaylistSongsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$PlaylistsTableTableReferences
                          ._playlistSongsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PlaylistsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).playlistSongsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.playlistId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PlaylistsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistsTableTable,
      PlaylistsTableData,
      $$PlaylistsTableTableFilterComposer,
      $$PlaylistsTableTableOrderingComposer,
      $$PlaylistsTableTableAnnotationComposer,
      $$PlaylistsTableTableCreateCompanionBuilder,
      $$PlaylistsTableTableUpdateCompanionBuilder,
      (PlaylistsTableData, $$PlaylistsTableTableReferences),
      PlaylistsTableData,
      PrefetchHooks Function({bool playlistSongsTableRefs})
    >;
typedef $$PlaylistSongsTableTableCreateCompanionBuilder =
    PlaylistSongsTableCompanion Function({
      required int playlistId,
      required String songId,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$PlaylistSongsTableTableUpdateCompanionBuilder =
    PlaylistSongsTableCompanion Function({
      Value<int> playlistId,
      Value<String> songId,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$PlaylistSongsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PlaylistSongsTableTable,
          PlaylistSongsTableData
        > {
  $$PlaylistSongsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlaylistsTableTable _playlistIdTable(_$AppDatabase db) =>
      db.playlistsTable.createAlias(
        $_aliasNameGenerator(
          db.playlistSongsTable.playlistId,
          db.playlistsTable.id,
        ),
      );

  $$PlaylistsTableTableProcessedTableManager get playlistId {
    final $_column = $_itemColumn<int>('playlist_id')!;

    final manager = $$PlaylistsTableTableTableManager(
      $_db,
      $_db.playlistsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playlistIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SongsTableTable _songIdTable(_$AppDatabase db) =>
      db.songsTable.createAlias(
        $_aliasNameGenerator(db.playlistSongsTable.songId, db.songsTable.id),
      );

  $$SongsTableTableProcessedTableManager get songId {
    final $_column = $_itemColumn<String>('song_id')!;

    final manager = $$SongsTableTableTableManager(
      $_db,
      $_db.songsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_songIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlaylistSongsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlaylistSongsTableTable> {
  $$PlaylistSongsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$PlaylistsTableTableFilterComposer get playlistId {
    final $$PlaylistsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableTableFilterComposer(
            $db: $db,
            $table: $db.playlistsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableTableFilterComposer get songId {
    final $$SongsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableFilterComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistSongsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaylistSongsTableTable> {
  $$PlaylistSongsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlaylistsTableTableOrderingComposer get playlistId {
    final $$PlaylistsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableTableOrderingComposer(
            $db: $db,
            $table: $db.playlistsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableTableOrderingComposer get songId {
    final $$SongsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableOrderingComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistSongsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaylistSongsTableTable> {
  $$PlaylistSongsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$PlaylistsTableTableAnnotationComposer get playlistId {
    final $$PlaylistsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playlistId,
      referencedTable: $db.playlistsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaylistsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.playlistsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SongsTableTableAnnotationComposer get songId {
    final $$SongsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaylistSongsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaylistSongsTableTable,
          PlaylistSongsTableData,
          $$PlaylistSongsTableTableFilterComposer,
          $$PlaylistSongsTableTableOrderingComposer,
          $$PlaylistSongsTableTableAnnotationComposer,
          $$PlaylistSongsTableTableCreateCompanionBuilder,
          $$PlaylistSongsTableTableUpdateCompanionBuilder,
          (PlaylistSongsTableData, $$PlaylistSongsTableTableReferences),
          PlaylistSongsTableData,
          PrefetchHooks Function({bool playlistId, bool songId})
        > {
  $$PlaylistSongsTableTableTableManager(
    _$AppDatabase db,
    $PlaylistSongsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaylistSongsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaylistSongsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaylistSongsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> playlistId = const Value.absent(),
                Value<String> songId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaylistSongsTableCompanion(
                playlistId: playlistId,
                songId: songId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int playlistId,
                required String songId,
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => PlaylistSongsTableCompanion.insert(
                playlistId: playlistId,
                songId: songId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaylistSongsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playlistId = false, songId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (playlistId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playlistId,
                                referencedTable:
                                    $$PlaylistSongsTableTableReferences
                                        ._playlistIdTable(db),
                                referencedColumn:
                                    $$PlaylistSongsTableTableReferences
                                        ._playlistIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (songId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.songId,
                                referencedTable:
                                    $$PlaylistSongsTableTableReferences
                                        ._songIdTable(db),
                                referencedColumn:
                                    $$PlaylistSongsTableTableReferences
                                        ._songIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlaylistSongsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaylistSongsTableTable,
      PlaylistSongsTableData,
      $$PlaylistSongsTableTableFilterComposer,
      $$PlaylistSongsTableTableOrderingComposer,
      $$PlaylistSongsTableTableAnnotationComposer,
      $$PlaylistSongsTableTableCreateCompanionBuilder,
      $$PlaylistSongsTableTableUpdateCompanionBuilder,
      (PlaylistSongsTableData, $$PlaylistSongsTableTableReferences),
      PlaylistSongsTableData,
      PrefetchHooks Function({bool playlistId, bool songId})
    >;
typedef $$HistoryTableTableCreateCompanionBuilder =
    HistoryTableCompanion Function({
      Value<int> id,
      required String songId,
      required DateTime datePlayed,
    });
typedef $$HistoryTableTableUpdateCompanionBuilder =
    HistoryTableCompanion Function({
      Value<int> id,
      Value<String> songId,
      Value<DateTime> datePlayed,
    });

final class $$HistoryTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryTableData> {
  $$HistoryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SongsTableTable _songIdTable(_$AppDatabase db) =>
      db.songsTable.createAlias(
        $_aliasNameGenerator(db.historyTable.songId, db.songsTable.id),
      );

  $$SongsTableTableProcessedTableManager get songId {
    final $_column = $_itemColumn<String>('song_id')!;

    final manager = $$SongsTableTableTableManager(
      $_db,
      $_db.songsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_songIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datePlayed => $composableBuilder(
    column: $table.datePlayed,
    builder: (column) => ColumnFilters(column),
  );

  $$SongsTableTableFilterComposer get songId {
    final $$SongsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableFilterComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datePlayed => $composableBuilder(
    column: $table.datePlayed,
    builder: (column) => ColumnOrderings(column),
  );

  $$SongsTableTableOrderingComposer get songId {
    final $$SongsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableOrderingComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get datePlayed => $composableBuilder(
    column: $table.datePlayed,
    builder: (column) => column,
  );

  $$SongsTableTableAnnotationComposer get songId {
    final $$SongsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.songsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryTableTable,
          HistoryTableData,
          $$HistoryTableTableFilterComposer,
          $$HistoryTableTableOrderingComposer,
          $$HistoryTableTableAnnotationComposer,
          $$HistoryTableTableCreateCompanionBuilder,
          $$HistoryTableTableUpdateCompanionBuilder,
          (HistoryTableData, $$HistoryTableTableReferences),
          HistoryTableData,
          PrefetchHooks Function({bool songId})
        > {
  $$HistoryTableTableTableManager(_$AppDatabase db, $HistoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> songId = const Value.absent(),
                Value<DateTime> datePlayed = const Value.absent(),
              }) => HistoryTableCompanion(
                id: id,
                songId: songId,
                datePlayed: datePlayed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String songId,
                required DateTime datePlayed,
              }) => HistoryTableCompanion.insert(
                id: id,
                songId: songId,
                datePlayed: datePlayed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoryTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({songId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (songId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.songId,
                                referencedTable: $$HistoryTableTableReferences
                                    ._songIdTable(db),
                                referencedColumn: $$HistoryTableTableReferences
                                    ._songIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryTableTable,
      HistoryTableData,
      $$HistoryTableTableFilterComposer,
      $$HistoryTableTableOrderingComposer,
      $$HistoryTableTableAnnotationComposer,
      $$HistoryTableTableCreateCompanionBuilder,
      $$HistoryTableTableUpdateCompanionBuilder,
      (HistoryTableData, $$HistoryTableTableReferences),
      HistoryTableData,
      PrefetchHooks Function({bool songId})
    >;
typedef $$SettingsTableTableCreateCompanionBuilder =
    SettingsTableCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableTableUpdateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTableTable,
          SettingsTableData,
          $$SettingsTableTableFilterComposer,
          $$SettingsTableTableOrderingComposer,
          $$SettingsTableTableAnnotationComposer,
          $$SettingsTableTableCreateCompanionBuilder,
          $$SettingsTableTableUpdateCompanionBuilder,
          (
            SettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $SettingsTableTable,
              SettingsTableData
            >,
          ),
          SettingsTableData,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableTableManager(_$AppDatabase db, $SettingsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  SettingsTableCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsTableCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTableTable,
      SettingsTableData,
      $$SettingsTableTableFilterComposer,
      $$SettingsTableTableOrderingComposer,
      $$SettingsTableTableAnnotationComposer,
      $$SettingsTableTableCreateCompanionBuilder,
      $$SettingsTableTableUpdateCompanionBuilder,
      (
        SettingsTableData,
        BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsTableData>,
      ),
      SettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$LyricsTableTableCreateCompanionBuilder =
    LyricsTableCompanion Function({
      required String songId,
      required int lrclibId,
      Value<String?> plainLyrics,
      Value<String?> syncedLyrics,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });
typedef $$LyricsTableTableUpdateCompanionBuilder =
    LyricsTableCompanion Function({
      Value<String> songId,
      Value<int> lrclibId,
      Value<String?> plainLyrics,
      Value<String?> syncedLyrics,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });

class $$LyricsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LyricsTableTable> {
  $$LyricsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lrclibId => $composableBuilder(
    column: $table.lrclibId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plainLyrics => $composableBuilder(
    column: $table.plainLyrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncedLyrics => $composableBuilder(
    column: $table.syncedLyrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LyricsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LyricsTableTable> {
  $$LyricsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get songId => $composableBuilder(
    column: $table.songId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lrclibId => $composableBuilder(
    column: $table.lrclibId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plainLyrics => $composableBuilder(
    column: $table.plainLyrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncedLyrics => $composableBuilder(
    column: $table.syncedLyrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LyricsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LyricsTableTable> {
  $$LyricsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get songId =>
      $composableBuilder(column: $table.songId, builder: (column) => column);

  GeneratedColumn<int> get lrclibId =>
      $composableBuilder(column: $table.lrclibId, builder: (column) => column);

  GeneratedColumn<String> get plainLyrics => $composableBuilder(
    column: $table.plainLyrics,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncedLyrics => $composableBuilder(
    column: $table.syncedLyrics,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);
}

class $$LyricsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LyricsTableTable,
          LyricsTableData,
          $$LyricsTableTableFilterComposer,
          $$LyricsTableTableOrderingComposer,
          $$LyricsTableTableAnnotationComposer,
          $$LyricsTableTableCreateCompanionBuilder,
          $$LyricsTableTableUpdateCompanionBuilder,
          (
            LyricsTableData,
            BaseReferences<_$AppDatabase, $LyricsTableTable, LyricsTableData>,
          ),
          LyricsTableData,
          PrefetchHooks Function()
        > {
  $$LyricsTableTableTableManager(_$AppDatabase db, $LyricsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LyricsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LyricsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LyricsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> songId = const Value.absent(),
                Value<int> lrclibId = const Value.absent(),
                Value<String?> plainLyrics = const Value.absent(),
                Value<String?> syncedLyrics = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LyricsTableCompanion(
                songId: songId,
                lrclibId: lrclibId,
                plainLyrics: plainLyrics,
                syncedLyrics: syncedLyrics,
                savedAt: savedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String songId,
                required int lrclibId,
                Value<String?> plainLyrics = const Value.absent(),
                Value<String?> syncedLyrics = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LyricsTableCompanion.insert(
                songId: songId,
                lrclibId: lrclibId,
                plainLyrics: plainLyrics,
                syncedLyrics: syncedLyrics,
                savedAt: savedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LyricsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LyricsTableTable,
      LyricsTableData,
      $$LyricsTableTableFilterComposer,
      $$LyricsTableTableOrderingComposer,
      $$LyricsTableTableAnnotationComposer,
      $$LyricsTableTableCreateCompanionBuilder,
      $$LyricsTableTableUpdateCompanionBuilder,
      (
        LyricsTableData,
        BaseReferences<_$AppDatabase, $LyricsTableTable, LyricsTableData>,
      ),
      LyricsTableData,
      PrefetchHooks Function()
    >;
typedef $$ExcludedFoldersTableTableCreateCompanionBuilder =
    ExcludedFoldersTableCompanion Function({
      required String path,
      Value<int> rowid,
    });
typedef $$ExcludedFoldersTableTableUpdateCompanionBuilder =
    ExcludedFoldersTableCompanion Function({
      Value<String> path,
      Value<int> rowid,
    });

class $$ExcludedFoldersTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExcludedFoldersTableTable> {
  $$ExcludedFoldersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExcludedFoldersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExcludedFoldersTableTable> {
  $$ExcludedFoldersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExcludedFoldersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExcludedFoldersTableTable> {
  $$ExcludedFoldersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);
}

class $$ExcludedFoldersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExcludedFoldersTableTable,
          ExcludedFoldersTableData,
          $$ExcludedFoldersTableTableFilterComposer,
          $$ExcludedFoldersTableTableOrderingComposer,
          $$ExcludedFoldersTableTableAnnotationComposer,
          $$ExcludedFoldersTableTableCreateCompanionBuilder,
          $$ExcludedFoldersTableTableUpdateCompanionBuilder,
          (
            ExcludedFoldersTableData,
            BaseReferences<
              _$AppDatabase,
              $ExcludedFoldersTableTable,
              ExcludedFoldersTableData
            >,
          ),
          ExcludedFoldersTableData,
          PrefetchHooks Function()
        > {
  $$ExcludedFoldersTableTableTableManager(
    _$AppDatabase db,
    $ExcludedFoldersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExcludedFoldersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExcludedFoldersTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExcludedFoldersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> path = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExcludedFoldersTableCompanion(path: path, rowid: rowid),
          createCompanionCallback:
              ({
                required String path,
                Value<int> rowid = const Value.absent(),
              }) => ExcludedFoldersTableCompanion.insert(
                path: path,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExcludedFoldersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExcludedFoldersTableTable,
      ExcludedFoldersTableData,
      $$ExcludedFoldersTableTableFilterComposer,
      $$ExcludedFoldersTableTableOrderingComposer,
      $$ExcludedFoldersTableTableAnnotationComposer,
      $$ExcludedFoldersTableTableCreateCompanionBuilder,
      $$ExcludedFoldersTableTableUpdateCompanionBuilder,
      (
        ExcludedFoldersTableData,
        BaseReferences<
          _$AppDatabase,
          $ExcludedFoldersTableTable,
          ExcludedFoldersTableData
        >,
      ),
      ExcludedFoldersTableData,
      PrefetchHooks Function()
    >;
typedef $$CloudSongsTableTableCreateCompanionBuilder =
    CloudSongsTableCompanion Function({
      required String id,
      required String title,
      required String artist,
      Value<String> album,
      Value<String?> thumbnailUri,
      Value<int> duration,
      Value<DateTime> dateAdded,
      Value<int> rowid,
    });
typedef $$CloudSongsTableTableUpdateCompanionBuilder =
    CloudSongsTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> artist,
      Value<String> album,
      Value<String?> thumbnailUri,
      Value<int> duration,
      Value<DateTime> dateAdded,
      Value<int> rowid,
    });

class $$CloudSongsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CloudSongsTableTable> {
  $$CloudSongsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailUri => $composableBuilder(
    column: $table.thumbnailUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CloudSongsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CloudSongsTableTable> {
  $$CloudSongsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailUri => $composableBuilder(
    column: $table.thumbnailUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CloudSongsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CloudSongsTableTable> {
  $$CloudSongsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUri => $composableBuilder(
    column: $table.thumbnailUri,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);
}

class $$CloudSongsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CloudSongsTableTable,
          CloudSongsTableData,
          $$CloudSongsTableTableFilterComposer,
          $$CloudSongsTableTableOrderingComposer,
          $$CloudSongsTableTableAnnotationComposer,
          $$CloudSongsTableTableCreateCompanionBuilder,
          $$CloudSongsTableTableUpdateCompanionBuilder,
          (
            CloudSongsTableData,
            BaseReferences<
              _$AppDatabase,
              $CloudSongsTableTable,
              CloudSongsTableData
            >,
          ),
          CloudSongsTableData,
          PrefetchHooks Function()
        > {
  $$CloudSongsTableTableTableManager(
    _$AppDatabase db,
    $CloudSongsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CloudSongsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CloudSongsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CloudSongsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<String> album = const Value.absent(),
                Value<String?> thumbnailUri = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CloudSongsTableCompanion(
                id: id,
                title: title,
                artist: artist,
                album: album,
                thumbnailUri: thumbnailUri,
                duration: duration,
                dateAdded: dateAdded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String artist,
                Value<String> album = const Value.absent(),
                Value<String?> thumbnailUri = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CloudSongsTableCompanion.insert(
                id: id,
                title: title,
                artist: artist,
                album: album,
                thumbnailUri: thumbnailUri,
                duration: duration,
                dateAdded: dateAdded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CloudSongsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CloudSongsTableTable,
      CloudSongsTableData,
      $$CloudSongsTableTableFilterComposer,
      $$CloudSongsTableTableOrderingComposer,
      $$CloudSongsTableTableAnnotationComposer,
      $$CloudSongsTableTableCreateCompanionBuilder,
      $$CloudSongsTableTableUpdateCompanionBuilder,
      (
        CloudSongsTableData,
        BaseReferences<
          _$AppDatabase,
          $CloudSongsTableTable,
          CloudSongsTableData
        >,
      ),
      CloudSongsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SongsTableTableTableManager get songsTable =>
      $$SongsTableTableTableManager(_db, _db.songsTable);
  $$PlaylistsTableTableTableManager get playlistsTable =>
      $$PlaylistsTableTableTableManager(_db, _db.playlistsTable);
  $$PlaylistSongsTableTableTableManager get playlistSongsTable =>
      $$PlaylistSongsTableTableTableManager(_db, _db.playlistSongsTable);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
  $$LyricsTableTableTableManager get lyricsTable =>
      $$LyricsTableTableTableManager(_db, _db.lyricsTable);
  $$ExcludedFoldersTableTableTableManager get excludedFoldersTable =>
      $$ExcludedFoldersTableTableTableManager(_db, _db.excludedFoldersTable);
  $$CloudSongsTableTableTableManager get cloudSongsTable =>
      $$CloudSongsTableTableTableManager(_db, _db.cloudSongsTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';
