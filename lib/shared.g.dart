// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared.dart';

// ignore_for_file: type=lint
class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _syncAtMeta = const VerificationMeta('syncAt');
  @override
  late final GeneratedColumn<int> syncAt = GeneratedColumn<int>(
      'sync_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
      'kind', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileMeta = const VerificationMeta('file');
  @override
  late final GeneratedColumn<String> file = GeneratedColumn<String>(
      'file', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  static const VerificationMeta _sigMeta = const VerificationMeta('sig');
  @override
  late final GeneratedColumn<String> sig = GeneratedColumn<String>(
      'sig', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pubkey, createdAt, syncAt, kind, content, file, sig];
  @override
  String get aliasedName => _alias ?? 'events';
  @override
  String get actualTableName => 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('sync_at')) {
      context.handle(_syncAtMeta,
          syncAt.isAcceptableOrUnknown(data['sync_at']!, _syncAtMeta));
    } else if (isInserting) {
      context.missing(_syncAtMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('file')) {
      context.handle(
          _fileMeta, file.isAcceptableOrUnknown(data['file']!, _fileMeta));
    }
    if (data.containsKey('sig')) {
      context.handle(
          _sigMeta, sig.isAcceptableOrUnknown(data['sig']!, _sigMeta));
    } else if (isInserting) {
      context.missing(_sigMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      syncAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_at'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      file: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file'])!,
      sig: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sig'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String pubkey;
  final int createdAt;
  final int syncAt;
  final int kind;
  final String content;
  final String file;
  final String sig;
  const Event(
      {required this.id,
      required this.pubkey,
      required this.createdAt,
      required this.syncAt,
      required this.kind,
      required this.content,
      required this.file,
      required this.sig});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    map['sync_at'] = Variable<int>(syncAt);
    map['kind'] = Variable<int>(kind);
    map['content'] = Variable<String>(content);
    map['file'] = Variable<String>(file);
    map['sig'] = Variable<String>(sig);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      syncAt: Value(syncAt),
      kind: Value(kind),
      content: Value(content),
      file: Value(file),
      sig: Value(sig),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      syncAt: serializer.fromJson<int>(json['syncAt']),
      kind: serializer.fromJson<int>(json['kind']),
      content: serializer.fromJson<String>(json['content']),
      file: serializer.fromJson<String>(json['file']),
      sig: serializer.fromJson<String>(json['sig']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'createdAt': serializer.toJson<int>(createdAt),
      'syncAt': serializer.toJson<int>(syncAt),
      'kind': serializer.toJson<int>(kind),
      'content': serializer.toJson<String>(content),
      'file': serializer.toJson<String>(file),
      'sig': serializer.toJson<String>(sig),
    };
  }

  Event copyWith(
          {String? id,
          String? pubkey,
          int? createdAt,
          int? syncAt,
          int? kind,
          String? content,
          String? file,
          String? sig}) =>
      Event(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        syncAt: syncAt ?? this.syncAt,
        kind: kind ?? this.kind,
        content: content ?? this.content,
        file: file ?? this.file,
        sig: sig ?? this.sig,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncAt: $syncAt, ')
          ..write('kind: $kind, ')
          ..write('content: $content, ')
          ..write('file: $file, ')
          ..write('sig: $sig')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pubkey, createdAt, syncAt, kind, content, file, sig);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.syncAt == this.syncAt &&
          other.kind == this.kind &&
          other.content == this.content &&
          other.file == this.file &&
          other.sig == this.sig);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<int> syncAt;
  final Value<int> kind;
  final Value<String> content;
  final Value<String> file;
  final Value<String> sig;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.content = const Value.absent(),
    this.file = const Value.absent(),
    this.sig = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String pubkey,
    required int createdAt,
    required int syncAt,
    required int kind,
    required String content,
    this.file = const Value.absent(),
    required String sig,
  })  : id = Value(id),
        pubkey = Value(pubkey),
        createdAt = Value(createdAt),
        syncAt = Value(syncAt),
        kind = Value(kind),
        content = Value(content),
        sig = Value(sig);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<int>? syncAt,
    Expression<int>? kind,
    Expression<String>? content,
    Expression<String>? file,
    Expression<String>? sig,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (syncAt != null) 'sync_at': syncAt,
      if (kind != null) 'kind': kind,
      if (content != null) 'content': content,
      if (file != null) 'file': file,
      if (sig != null) 'sig': sig,
    });
  }

  EventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<int>? createdAt,
      Value<int>? syncAt,
      Value<int>? kind,
      Value<String>? content,
      Value<String>? file,
      Value<String>? sig}) {
    return EventsCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      syncAt: syncAt ?? this.syncAt,
      kind: kind ?? this.kind,
      content: content ?? this.content,
      file: file ?? this.file,
      sig: sig ?? this.sig,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (syncAt.present) {
      map['sync_at'] = Variable<int>(syncAt.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (file.present) {
      map['file'] = Variable<String>(file.value);
    }
    if (sig.present) {
      map['sig'] = Variable<String>(sig.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncAt: $syncAt, ')
          ..write('kind: $kind, ')
          ..write('content: $content, ')
          ..write('file: $file, ')
          ..write('sig: $sig')
          ..write(')'))
        .toString();
  }
}

class $KeysTable extends Keys with TableInfo<$KeysTable, Key> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _iMeta = const VerificationMeta('i');
  @override
  late final GeneratedColumn<int> i = GeneratedColumn<int>(
      'i', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _privateMeta =
      const VerificationMeta('private');
  @override
  late final GeneratedColumn<String> private = GeneratedColumn<String>(
      'private', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _publicMeta = const VerificationMeta('public');
  @override
  late final GeneratedColumn<String> public = GeneratedColumn<String>(
      'public', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [i, private, public];
  @override
  String get aliasedName => _alias ?? 'keys';
  @override
  String get actualTableName => 'keys';
  @override
  VerificationContext validateIntegrity(Insertable<Key> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('i')) {
      context.handle(_iMeta, i.isAcceptableOrUnknown(data['i']!, _iMeta));
    }
    if (data.containsKey('private')) {
      context.handle(_privateMeta,
          private.isAcceptableOrUnknown(data['private']!, _privateMeta));
    } else if (isInserting) {
      context.missing(_privateMeta);
    }
    if (data.containsKey('public')) {
      context.handle(_publicMeta,
          public.isAcceptableOrUnknown(data['public']!, _publicMeta));
    } else if (isInserting) {
      context.missing(_publicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {i};
  @override
  Key map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Key(
      i: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}i'])!,
      private: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}private'])!,
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}public'])!,
    );
  }

  @override
  $KeysTable createAlias(String alias) {
    return $KeysTable(attachedDatabase, alias);
  }
}

class Key extends DataClass implements Insertable<Key> {
  final int i;
  final String private;
  final String public;
  const Key({required this.i, required this.private, required this.public});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['i'] = Variable<int>(i);
    map['private'] = Variable<String>(private);
    map['public'] = Variable<String>(public);
    return map;
  }

  KeysCompanion toCompanion(bool nullToAbsent) {
    return KeysCompanion(
      i: Value(i),
      private: Value(private),
      public: Value(public),
    );
  }

  factory Key.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Key(
      i: serializer.fromJson<int>(json['i']),
      private: serializer.fromJson<String>(json['private']),
      public: serializer.fromJson<String>(json['public']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'i': serializer.toJson<int>(i),
      'private': serializer.toJson<String>(private),
      'public': serializer.toJson<String>(public),
    };
  }

  Key copyWith({int? i, String? private, String? public}) => Key(
        i: i ?? this.i,
        private: private ?? this.private,
        public: public ?? this.public,
      );
  @override
  String toString() {
    return (StringBuffer('Key(')
          ..write('i: $i, ')
          ..write('private: $private, ')
          ..write('public: $public')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(i, private, public);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Key &&
          other.i == this.i &&
          other.private == this.private &&
          other.public == this.public);
}

class KeysCompanion extends UpdateCompanion<Key> {
  final Value<int> i;
  final Value<String> private;
  final Value<String> public;
  const KeysCompanion({
    this.i = const Value.absent(),
    this.private = const Value.absent(),
    this.public = const Value.absent(),
  });
  KeysCompanion.insert({
    this.i = const Value.absent(),
    required String private,
    required String public,
  })  : private = Value(private),
        public = Value(public);
  static Insertable<Key> custom({
    Expression<int>? i,
    Expression<String>? private,
    Expression<String>? public,
  }) {
    return RawValuesInsertable({
      if (i != null) 'i': i,
      if (private != null) 'private': private,
      if (public != null) 'public': public,
    });
  }

  KeysCompanion copyWith(
      {Value<int>? i, Value<String>? private, Value<String>? public}) {
    return KeysCompanion(
      i: i ?? this.i,
      private: private ?? this.private,
      public: public ?? this.public,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (i.present) {
      map['i'] = Variable<int>(i.value);
    }
    if (private.present) {
      map['private'] = Variable<String>(private.value);
    }
    if (public.present) {
      map['public'] = Variable<String>(public.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeysCompanion(')
          ..write('i: $i, ')
          ..write('private: $private, ')
          ..write('public: $public')
          ..write(')'))
        .toString();
  }
}

abstract class _$SharedDatabase extends GeneratedDatabase {
  _$SharedDatabase(QueryExecutor e) : super(e);
  late final $EventsTable events = $EventsTable(this);
  late final $KeysTable keys = $KeysTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [events, keys];
}
