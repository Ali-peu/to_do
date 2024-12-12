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
      'time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remindTimeMeta =
      const VerificationMeta('remindTime');
  @override
  late final GeneratedColumn<DateTime> remindTime = GeneratedColumn<DateTime>(
      'remind_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
      'created_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedTimeMeta =
      const VerificationMeta('updatedTime');
  @override
  late final GeneratedColumn<DateTime> updatedTime = GeneratedColumn<DateTime>(
      'updated_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedTimeMeta =
      const VerificationMeta('deletedTime');
  @override
  late final GeneratedColumn<DateTime> deletedTime = GeneratedColumn<DateTime>(
      'deleted_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        isDone,
        category,
        isThisStar,
        time,
        remindTime,
        createdTime,
        updatedTime,
        deletedTime
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
    }
    if (data.containsKey('remind_time')) {
      context.handle(
          _remindTimeMeta,
          remindTime.isAcceptableOrUnknown(
              data['remind_time']!, _remindTimeMeta));
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    if (data.containsKey('updated_time')) {
      context.handle(
          _updatedTimeMeta,
          updatedTime.isAcceptableOrUnknown(
              data['updated_time']!, _updatedTimeMeta));
    }
    if (data.containsKey('deleted_time')) {
      context.handle(
          _deletedTimeMeta,
          deletedTime.isAcceptableOrUnknown(
              data['deleted_time']!, _deletedTimeMeta));
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time']),
      remindTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}remind_time']),
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_time'])!,
      updatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_time']),
      deletedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_time']),
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
  final DateTime? time;
  final DateTime? remindTime;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final DateTime? deletedTime;
  const Note(
      {required this.id,
      required this.description,
      required this.isDone,
      required this.category,
      required this.isThisStar,
      this.time,
      this.remindTime,
      required this.createdTime,
      this.updatedTime,
      this.deletedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['is_done'] = Variable<bool>(isDone);
    map['category'] = Variable<String>(category);
    map['is_this_star'] = Variable<bool>(isThisStar);
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    if (!nullToAbsent || remindTime != null) {
      map['remind_time'] = Variable<DateTime>(remindTime);
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || updatedTime != null) {
      map['updated_time'] = Variable<DateTime>(updatedTime);
    }
    if (!nullToAbsent || deletedTime != null) {
      map['deleted_time'] = Variable<DateTime>(deletedTime);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      description: Value(description),
      isDone: Value(isDone),
      category: Value(category),
      isThisStar: Value(isThisStar),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      remindTime: remindTime == null && nullToAbsent
          ? const Value.absent()
          : Value(remindTime),
      createdTime: Value(createdTime),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      deletedTime: deletedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedTime),
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
      time: serializer.fromJson<DateTime?>(json['time']),
      remindTime: serializer.fromJson<DateTime?>(json['remindTime']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      updatedTime: serializer.fromJson<DateTime?>(json['updatedTime']),
      deletedTime: serializer.fromJson<DateTime?>(json['deletedTime']),
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
      'time': serializer.toJson<DateTime?>(time),
      'remindTime': serializer.toJson<DateTime?>(remindTime),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deletedTime': serializer.toJson<DateTime?>(deletedTime),
    };
  }

  Note copyWith(
          {int? id,
          String? description,
          bool? isDone,
          String? category,
          bool? isThisStar,
          Value<DateTime?> time = const Value.absent(),
          Value<DateTime?> remindTime = const Value.absent(),
          DateTime? createdTime,
          Value<DateTime?> updatedTime = const Value.absent(),
          Value<DateTime?> deletedTime = const Value.absent()}) =>
      Note(
        id: id ?? this.id,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        category: category ?? this.category,
        isThisStar: isThisStar ?? this.isThisStar,
        time: time.present ? time.value : this.time,
        remindTime: remindTime.present ? remindTime.value : this.remindTime,
        createdTime: createdTime ?? this.createdTime,
        updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
        deletedTime: deletedTime.present ? deletedTime.value : this.deletedTime,
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
      remindTime:
          data.remindTime.present ? data.remindTime.value : this.remindTime,
      createdTime:
          data.createdTime.present ? data.createdTime.value : this.createdTime,
      updatedTime:
          data.updatedTime.present ? data.updatedTime.value : this.updatedTime,
      deletedTime:
          data.deletedTime.present ? data.deletedTime.value : this.deletedTime,
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
          ..write('remindTime: $remindTime, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deletedTime: $deletedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, isDone, category, isThisStar,
      time, remindTime, createdTime, updatedTime, deletedTime);
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
          other.remindTime == this.remindTime &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deletedTime == this.deletedTime);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> isDone;
  final Value<String> category;
  final Value<bool> isThisStar;
  final Value<DateTime?> time;
  final Value<DateTime?> remindTime;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<DateTime?> deletedTime;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isDone = const Value.absent(),
    this.category = const Value.absent(),
    this.isThisStar = const Value.absent(),
    this.time = const Value.absent(),
    this.remindTime = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deletedTime = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required bool isDone,
    required String category,
    required bool isThisStar,
    this.time = const Value.absent(),
    this.remindTime = const Value.absent(),
    required DateTime createdTime,
    this.updatedTime = const Value.absent(),
    this.deletedTime = const Value.absent(),
  })  : description = Value(description),
        isDone = Value(isDone),
        category = Value(category),
        isThisStar = Value(isThisStar),
        createdTime = Value(createdTime);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<bool>? isDone,
    Expression<String>? category,
    Expression<bool>? isThisStar,
    Expression<DateTime>? time,
    Expression<DateTime>? remindTime,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<DateTime>? deletedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (isDone != null) 'is_done': isDone,
      if (category != null) 'category': category,
      if (isThisStar != null) 'is_this_star': isThisStar,
      if (time != null) 'time': time,
      if (remindTime != null) 'remind_time': remindTime,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deletedTime != null) 'deleted_time': deletedTime,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<bool>? isDone,
      Value<String>? category,
      Value<bool>? isThisStar,
      Value<DateTime?>? time,
      Value<DateTime?>? remindTime,
      Value<DateTime>? createdTime,
      Value<DateTime?>? updatedTime,
      Value<DateTime?>? deletedTime}) {
    return NotesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
      isThisStar: isThisStar ?? this.isThisStar,
      time: time ?? this.time,
      remindTime: remindTime ?? this.remindTime,
      createdTime: createdTime ?? this.createdTime,
      updatedTime: updatedTime ?? this.updatedTime,
      deletedTime: deletedTime ?? this.deletedTime,
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
    if (remindTime.present) {
      map['remind_time'] = Variable<DateTime>(remindTime.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (updatedTime.present) {
      map['updated_time'] = Variable<DateTime>(updatedTime.value);
    }
    if (deletedTime.present) {
      map['deleted_time'] = Variable<DateTime>(deletedTime.value);
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
          ..write('remindTime: $remindTime, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deletedTime: $deletedTime')
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
  Value<DateTime?> time,
  Value<DateTime?> remindTime,
  required DateTime createdTime,
  Value<DateTime?> updatedTime,
  Value<DateTime?> deletedTime,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<bool> isDone,
  Value<String> category,
  Value<bool> isThisStar,
  Value<DateTime?> time,
  Value<DateTime?> remindTime,
  Value<DateTime> createdTime,
  Value<DateTime?> updatedTime,
  Value<DateTime?> deletedTime,
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

  ColumnFilters<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedTime => $composableBuilder(
      column: $table.updatedTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedTime => $composableBuilder(
      column: $table.deletedTime, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedTime => $composableBuilder(
      column: $table.updatedTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedTime => $composableBuilder(
      column: $table.deletedTime, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedTime => $composableBuilder(
      column: $table.updatedTime, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedTime => $composableBuilder(
      column: $table.deletedTime, builder: (column) => column);
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
            Value<DateTime?> time = const Value.absent(),
            Value<DateTime?> remindTime = const Value.absent(),
            Value<DateTime> createdTime = const Value.absent(),
            Value<DateTime?> updatedTime = const Value.absent(),
            Value<DateTime?> deletedTime = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            description: description,
            isDone: isDone,
            category: category,
            isThisStar: isThisStar,
            time: time,
            remindTime: remindTime,
            createdTime: createdTime,
            updatedTime: updatedTime,
            deletedTime: deletedTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required bool isDone,
            required String category,
            required bool isThisStar,
            Value<DateTime?> time = const Value.absent(),
            Value<DateTime?> remindTime = const Value.absent(),
            required DateTime createdTime,
            Value<DateTime?> updatedTime = const Value.absent(),
            Value<DateTime?> deletedTime = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            description: description,
            isDone: isDone,
            category: category,
            isThisStar: isThisStar,
            time: time,
            remindTime: remindTime,
            createdTime: createdTime,
            updatedTime: updatedTime,
            deletedTime: deletedTime,
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
