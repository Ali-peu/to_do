// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isThisStarMeta =
      const VerificationMeta('isThisStar');
  @override
  late final GeneratedColumn<bool> isThisStar = GeneratedColumn<bool>(
      'is_this_star', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_this_star" IN (0, 1))'));
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _replayTime1Meta =
      const VerificationMeta('replayTime1');
  @override
  late final GeneratedColumn<DateTime> replayTime1 = GeneratedColumn<DateTime>(
      'replay_time1', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _replayTime2Meta =
      const VerificationMeta('replayTime2');
  @override
  late final GeneratedColumn<DateTime> replayTime2 = GeneratedColumn<DateTime>(
      'replay_time2', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        isDone,
        category,
        isThisStar,
        time,
        replayTime1,
        replayTime2
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    } else if (isInserting) {
      context.missing(_isDoneMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_this_star')) {
      context.handle(
          _isThisStarMeta,
          isThisStar.isAcceptableOrUnknown(
              data['is_this_star']!, _isThisStarMeta));
    } else if (isInserting) {
      context.missing(_isThisStarMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('replay_time1')) {
      context.handle(
          _replayTime1Meta,
          replayTime1.isAcceptableOrUnknown(
              data['replay_time1']!, _replayTime1Meta));
    } else if (isInserting) {
      context.missing(_replayTime1Meta);
    }
    if (data.containsKey('replay_time2')) {
      context.handle(
          _replayTime2Meta,
          replayTime2.isAcceptableOrUnknown(
              data['replay_time2']!, _replayTime2Meta));
    } else if (isInserting) {
      context.missing(_replayTime2Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isThisStar: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_this_star'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      replayTime1: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}replay_time1'])!,
      replayTime2: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}replay_time2'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String description;
  final bool isDone;
  final String category;
  final bool isThisStar;
  final DateTime time;
  final DateTime replayTime1;
  final DateTime replayTime2;
  const Note(
      {required this.id,
      required this.description,
      required this.isDone,
      required this.category,
      required this.isThisStar,
      required this.time,
      required this.replayTime1,
      required this.replayTime2});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['is_done'] = Variable<bool>(isDone);
    map['category'] = Variable<String>(category);
    map['is_this_star'] = Variable<bool>(isThisStar);
    map['time'] = Variable<DateTime>(time);
    map['replay_time1'] = Variable<DateTime>(replayTime1);
    map['replay_time2'] = Variable<DateTime>(replayTime2);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      description: Value(description),
      isDone: Value(isDone),
      category: Value(category),
      isThisStar: Value(isThisStar),
      time: Value(time),
      replayTime1: Value(replayTime1),
      replayTime2: Value(replayTime2),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      category: serializer.fromJson<String>(json['category']),
      isThisStar: serializer.fromJson<bool>(json['isThisStar']),
      time: serializer.fromJson<DateTime>(json['time']),
      replayTime1: serializer.fromJson<DateTime>(json['replayTime1']),
      replayTime2: serializer.fromJson<DateTime>(json['replayTime2']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'isDone': serializer.toJson<bool>(isDone),
      'category': serializer.toJson<String>(category),
      'isThisStar': serializer.toJson<bool>(isThisStar),
      'time': serializer.toJson<DateTime>(time),
      'replayTime1': serializer.toJson<DateTime>(replayTime1),
      'replayTime2': serializer.toJson<DateTime>(replayTime2),
    };
  }

  Note copyWith(
          {int? id,
          String? description,
          bool? isDone,
          String? category,
          bool? isThisStar,
          DateTime? time,
          DateTime? replayTime1,
          DateTime? replayTime2}) =>
      Note(
        id: id ?? this.id,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        category: category ?? this.category,
        isThisStar: isThisStar ?? this.isThisStar,
        time: time ?? this.time,
        replayTime1: replayTime1 ?? this.replayTime1,
        replayTime2: replayTime2 ?? this.replayTime2,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      category: data.category.present ? data.category.value : this.category,
      isThisStar:
          data.isThisStar.present ? data.isThisStar.value : this.isThisStar,
      time: data.time.present ? data.time.value : this.time,
      replayTime1:
          data.replayTime1.present ? data.replayTime1.value : this.replayTime1,
      replayTime2:
          data.replayTime2.present ? data.replayTime2.value : this.replayTime2,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('category: $category, ')
          ..write('isThisStar: $isThisStar, ')
          ..write('time: $time, ')
          ..write('replayTime1: $replayTime1, ')
          ..write('replayTime2: $replayTime2')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, isDone, category, isThisStar,
      time, replayTime1, replayTime2);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.description == this.description &&
          other.isDone == this.isDone &&
          other.category == this.category &&
          other.isThisStar == this.isThisStar &&
          other.time == this.time &&
          other.replayTime1 == this.replayTime1 &&
          other.replayTime2 == this.replayTime2);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> isDone;
  final Value<String> category;
  final Value<bool> isThisStar;
  final Value<DateTime> time;
  final Value<DateTime> replayTime1;
  final Value<DateTime> replayTime2;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isDone = const Value.absent(),
    this.category = const Value.absent(),
    this.isThisStar = const Value.absent(),
    this.time = const Value.absent(),
    this.replayTime1 = const Value.absent(),
    this.replayTime2 = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required bool isDone,
    required String category,
    required bool isThisStar,
    required DateTime time,
    required DateTime replayTime1,
    required DateTime replayTime2,
  })  : description = Value(description),
        isDone = Value(isDone),
        category = Value(category),
        isThisStar = Value(isThisStar),
        time = Value(time),
        replayTime1 = Value(replayTime1),
        replayTime2 = Value(replayTime2);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<bool>? isDone,
    Expression<String>? category,
    Expression<bool>? isThisStar,
    Expression<DateTime>? time,
    Expression<DateTime>? replayTime1,
    Expression<DateTime>? replayTime2,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (isDone != null) 'is_done': isDone,
      if (category != null) 'category': category,
      if (isThisStar != null) 'is_this_star': isThisStar,
      if (time != null) 'time': time,
      if (replayTime1 != null) 'replay_time1': replayTime1,
      if (replayTime2 != null) 'replay_time2': replayTime2,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<bool>? isDone,
      Value<String>? category,
      Value<bool>? isThisStar,
      Value<DateTime>? time,
      Value<DateTime>? replayTime1,
      Value<DateTime>? replayTime2}) {
    return NotesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
      isThisStar: isThisStar ?? this.isThisStar,
      time: time ?? this.time,
      replayTime1: replayTime1 ?? this.replayTime1,
      replayTime2: replayTime2 ?? this.replayTime2,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isThisStar.present) {
      map['is_this_star'] = Variable<bool>(isThisStar.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (replayTime1.present) {
      map['replay_time1'] = Variable<DateTime>(replayTime1.value);
    }
    if (replayTime2.present) {
      map['replay_time2'] = Variable<DateTime>(replayTime2.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isDone: $isDone, ')
          ..write('category: $category, ')
          ..write('isThisStar: $isThisStar, ')
          ..write('time: $time, ')
          ..write('replayTime1: $replayTime1, ')
          ..write('replayTime2: $replayTime2')
          ..write(')'))
        .toString();
  }
}

class $CategoryNotesTable extends CategoryNotes
    with TableInfo<$CategoryNotesTable, CategoryNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_notes';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryNote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryNote(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $CategoryNotesTable createAlias(String alias) {
    return $CategoryNotesTable(attachedDatabase, alias);
  }
}

class CategoryNote extends DataClass implements Insertable<CategoryNote> {
  final int id;
  final String category;
  const CategoryNote({required this.id, required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    return map;
  }

  CategoryNotesCompanion toCompanion(bool nullToAbsent) {
    return CategoryNotesCompanion(
      id: Value(id),
      category: Value(category),
    );
  }

  factory CategoryNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryNote(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
    };
  }

  CategoryNote copyWith({int? id, String? category}) => CategoryNote(
        id: id ?? this.id,
        category: category ?? this.category,
      );
  CategoryNote copyWithCompanion(CategoryNotesCompanion data) {
    return CategoryNote(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryNote(')
          ..write('id: $id, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryNote &&
          other.id == this.id &&
          other.category == this.category);
}

class CategoryNotesCompanion extends UpdateCompanion<CategoryNote> {
  final Value<int> id;
  final Value<String> category;
  const CategoryNotesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
  });
  CategoryNotesCompanion.insert({
    this.id = const Value.absent(),
    required String category,
  }) : category = Value(category);
  static Insertable<CategoryNote> custom({
    Expression<int>? id,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
    });
  }

  CategoryNotesCompanion copyWith({Value<int>? id, Value<String>? category}) {
    return CategoryNotesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryNotesCompanion(')
          ..write('id: $id, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $CategoryNotesTable categoryNotes = $CategoryNotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes, categoryNotes];
}

typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  required String description,
  required bool isDone,
  required String category,
  required bool isThisStar,
  required DateTime time,
  required DateTime replayTime1,
  required DateTime replayTime2,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<bool> isDone,
  Value<String> category,
  Value<bool> isThisStar,
  Value<DateTime> time,
  Value<DateTime> replayTime1,
  Value<DateTime> replayTime2,
});

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDone => $composableBuilder(
      column: $table.isDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isThisStar => $composableBuilder(
      column: $table.isThisStar, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get replayTime1 => $composableBuilder(
      column: $table.replayTime1, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get replayTime2 => $composableBuilder(
      column: $table.replayTime2, builder: (column) => ColumnFilters(column));
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDone => $composableBuilder(
      column: $table.isDone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isThisStar => $composableBuilder(
      column: $table.isThisStar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get replayTime1 => $composableBuilder(
      column: $table.replayTime1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get replayTime2 => $composableBuilder(
      column: $table.replayTime2, builder: (column) => ColumnOrderings(column));
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isThisStar => $composableBuilder(
      column: $table.isThisStar, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<DateTime> get replayTime1 => $composableBuilder(
      column: $table.replayTime1, builder: (column) => column);

  GeneratedColumn<DateTime> get replayTime2 => $composableBuilder(
      column: $table.replayTime2, builder: (column) => column);
}

class $$NotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()> {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isThisStar = const Value.absent(),
            Value<DateTime> time = const Value.absent(),
            Value<DateTime> replayTime1 = const Value.absent(),
            Value<DateTime> replayTime2 = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            description: description,
            isDone: isDone,
            category: category,
            isThisStar: isThisStar,
            time: time,
            replayTime1: replayTime1,
            replayTime2: replayTime2,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required bool isDone,
            required String category,
            required bool isThisStar,
            required DateTime time,
            required DateTime replayTime1,
            required DateTime replayTime2,
          }) =>
              NotesCompanion.insert(
            id: id,
            description: description,
            isDone: isDone,
            category: category,
            isThisStar: isThisStar,
            time: time,
            replayTime1: replayTime1,
            replayTime2: replayTime2,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()>;
typedef $$CategoryNotesTableCreateCompanionBuilder = CategoryNotesCompanion
    Function({
  Value<int> id,
  required String category,
});
typedef $$CategoryNotesTableUpdateCompanionBuilder = CategoryNotesCompanion
    Function({
  Value<int> id,
  Value<String> category,
});

class $$CategoryNotesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryNotesTable> {
  $$CategoryNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));
}

class $$CategoryNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryNotesTable> {
  $$CategoryNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$CategoryNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryNotesTable> {
  $$CategoryNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$CategoryNotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryNotesTable,
    CategoryNote,
    $$CategoryNotesTableFilterComposer,
    $$CategoryNotesTableOrderingComposer,
    $$CategoryNotesTableAnnotationComposer,
    $$CategoryNotesTableCreateCompanionBuilder,
    $$CategoryNotesTableUpdateCompanionBuilder,
    (
      CategoryNote,
      BaseReferences<_$AppDatabase, $CategoryNotesTable, CategoryNote>
    ),
    CategoryNote,
    PrefetchHooks Function()> {
  $$CategoryNotesTableTableManager(_$AppDatabase db, $CategoryNotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> category = const Value.absent(),
          }) =>
              CategoryNotesCompanion(
            id: id,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String category,
          }) =>
              CategoryNotesCompanion.insert(
            id: id,
            category: category,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryNotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryNotesTable,
    CategoryNote,
    $$CategoryNotesTableFilterComposer,
    $$CategoryNotesTableOrderingComposer,
    $$CategoryNotesTableAnnotationComposer,
    $$CategoryNotesTableCreateCompanionBuilder,
    $$CategoryNotesTableUpdateCompanionBuilder,
    (
      CategoryNote,
      BaseReferences<_$AppDatabase, $CategoryNotesTable, CategoryNote>
    ),
    CategoryNote,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$CategoryNotesTableTableManager get categoryNotes =>
      $$CategoryNotesTableTableManager(_db, _db.categoryNotes);
}
