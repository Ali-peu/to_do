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
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'));
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
      'created_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: DateTime.now);
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
  List<GeneratedColumn> get $columns =>
      [id, category, isFavourite, createdTime, updatedTime, deletedTime];
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
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    } else if (isInserting) {
      context.missing(_isFavouriteMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
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
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isFavourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favourite'])!,
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
  final String category;
  final bool isFavourite;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final DateTime? deletedTime;
  const Note(
      {required this.id,
      required this.category,
      required this.isFavourite,
      required this.createdTime,
      this.updatedTime,
      this.deletedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['is_favourite'] = Variable<bool>(isFavourite);
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
      category: Value(category),
      isFavourite: Value(isFavourite),
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
      category: serializer.fromJson<String>(json['category']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
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
      'category': serializer.toJson<String>(category),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'updatedTime': serializer.toJson<DateTime?>(updatedTime),
      'deletedTime': serializer.toJson<DateTime?>(deletedTime),
    };
  }

  Note copyWith(
          {int? id,
          String? category,
          bool? isFavourite,
          DateTime? createdTime,
          Value<DateTime?> updatedTime = const Value.absent(),
          Value<DateTime?> deletedTime = const Value.absent()}) =>
      Note(
        id: id ?? this.id,
        category: category ?? this.category,
        isFavourite: isFavourite ?? this.isFavourite,
        createdTime: createdTime ?? this.createdTime,
        updatedTime: updatedTime.present ? updatedTime.value : this.updatedTime,
        deletedTime: deletedTime.present ? deletedTime.value : this.deletedTime,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
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
          ..write('category: $category, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('createdTime: $createdTime, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('deletedTime: $deletedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, category, isFavourite, createdTime, updatedTime, deletedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.category == this.category &&
          other.isFavourite == this.isFavourite &&
          other.createdTime == this.createdTime &&
          other.updatedTime == this.updatedTime &&
          other.deletedTime == this.deletedTime);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> category;
  final Value<bool> isFavourite;
  final Value<DateTime> createdTime;
  final Value<DateTime?> updatedTime;
  final Value<DateTime?> deletedTime;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deletedTime = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required bool isFavourite,
    this.createdTime = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.deletedTime = const Value.absent(),
  })  : category = Value(category),
        isFavourite = Value(isFavourite);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<bool>? isFavourite,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? updatedTime,
    Expression<DateTime>? deletedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (createdTime != null) 'created_time': createdTime,
      if (updatedTime != null) 'updated_time': updatedTime,
      if (deletedTime != null) 'deleted_time': deletedTime,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? category,
      Value<bool>? isFavourite,
      Value<DateTime>? createdTime,
      Value<DateTime?>? updatedTime,
      Value<DateTime?>? deletedTime}) {
    return NotesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      isFavourite: isFavourite ?? this.isFavourite,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
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
          ..write('category: $category, ')
          ..write('isFavourite: $isFavourite, ')
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

class $SubNotesTable extends SubNotes with TableInfo<$SubNotesTable, SubNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubNotesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _importanceValueMeta =
      const VerificationMeta('importanceValue');
  @override
  late final GeneratedColumn<int> importanceValue = GeneratedColumn<int>(
      'importance_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, parentId, comment, importanceValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_notes';
  @override
  VerificationContext validateIntegrity(Insertable<SubNote> instance,
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
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('importance_value')) {
      context.handle(
          _importanceValueMeta,
          importanceValue.isAcceptableOrUnknown(
              data['importance_value']!, _importanceValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubNote(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      importanceValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}importance_value']),
    );
  }

  @override
  $SubNotesTable createAlias(String alias) {
    return $SubNotesTable(attachedDatabase, alias);
  }
}

class SubNote extends DataClass implements Insertable<SubNote> {
  final int id;
  final String description;
  final int parentId;
  final String? comment;
  final int? importanceValue;
  const SubNote(
      {required this.id,
      required this.description,
      required this.parentId,
      this.comment,
      this.importanceValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['parent_id'] = Variable<int>(parentId);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || importanceValue != null) {
      map['importance_value'] = Variable<int>(importanceValue);
    }
    return map;
  }

  SubNotesCompanion toCompanion(bool nullToAbsent) {
    return SubNotesCompanion(
      id: Value(id),
      description: Value(description),
      parentId: Value(parentId),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      importanceValue: importanceValue == null && nullToAbsent
          ? const Value.absent()
          : Value(importanceValue),
    );
  }

  factory SubNote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubNote(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      parentId: serializer.fromJson<int>(json['parentId']),
      comment: serializer.fromJson<String?>(json['comment']),
      importanceValue: serializer.fromJson<int?>(json['importanceValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'parentId': serializer.toJson<int>(parentId),
      'comment': serializer.toJson<String?>(comment),
      'importanceValue': serializer.toJson<int?>(importanceValue),
    };
  }

  SubNote copyWith(
          {int? id,
          String? description,
          int? parentId,
          Value<String?> comment = const Value.absent(),
          Value<int?> importanceValue = const Value.absent()}) =>
      SubNote(
        id: id ?? this.id,
        description: description ?? this.description,
        parentId: parentId ?? this.parentId,
        comment: comment.present ? comment.value : this.comment,
        importanceValue: importanceValue.present
            ? importanceValue.value
            : this.importanceValue,
      );
  SubNote copyWithCompanion(SubNotesCompanion data) {
    return SubNote(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      comment: data.comment.present ? data.comment.value : this.comment,
      importanceValue: data.importanceValue.present
          ? data.importanceValue.value
          : this.importanceValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubNote(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('comment: $comment, ')
          ..write('importanceValue: $importanceValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, description, parentId, comment, importanceValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubNote &&
          other.id == this.id &&
          other.description == this.description &&
          other.parentId == this.parentId &&
          other.comment == this.comment &&
          other.importanceValue == this.importanceValue);
}

class SubNotesCompanion extends UpdateCompanion<SubNote> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> parentId;
  final Value<String?> comment;
  final Value<int?> importanceValue;
  const SubNotesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.parentId = const Value.absent(),
    this.comment = const Value.absent(),
    this.importanceValue = const Value.absent(),
  });
  SubNotesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required int parentId,
    this.comment = const Value.absent(),
    this.importanceValue = const Value.absent(),
  })  : description = Value(description),
        parentId = Value(parentId);
  static Insertable<SubNote> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? parentId,
    Expression<String>? comment,
    Expression<int>? importanceValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (parentId != null) 'parent_id': parentId,
      if (comment != null) 'comment': comment,
      if (importanceValue != null) 'importance_value': importanceValue,
    });
  }

  SubNotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<int>? parentId,
      Value<String?>? comment,
      Value<int?>? importanceValue}) {
    return SubNotesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
      comment: comment ?? this.comment,
      importanceValue: importanceValue ?? this.importanceValue,
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
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (importanceValue.present) {
      map['importance_value'] = Variable<int>(importanceValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubNotesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId, ')
          ..write('comment: $comment, ')
          ..write('importanceValue: $importanceValue')
          ..write(')'))
        .toString();
  }
}

class $NoteTextsTable extends NoteTexts
    with TableInfo<$NoteTextsTable, NoteText> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTextsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _textValueMeta =
      const VerificationMeta('textValue');
  @override
  late final GeneratedColumn<String> textValue = GeneratedColumn<String>(
      'text_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weightValueMeta =
      const VerificationMeta('weightValue');
  @override
  late final GeneratedColumn<int> weightValue = GeneratedColumn<int>(
      'weight_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCursivMeta =
      const VerificationMeta('isCursiv');
  @override
  late final GeneratedColumn<bool> isCursiv = GeneratedColumn<bool>(
      'is_cursiv', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_cursiv" IN (0, 1))'));
  static const VerificationMeta _textSizeMeta =
      const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double> textSize = GeneratedColumn<double>(
      'text_size', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, noteId, textValue, weightValue, colorHex, isCursiv, textSize];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_texts';
  @override
  VerificationContext validateIntegrity(Insertable<NoteText> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('note_id')) {
      context.handle(_noteIdMeta,
          noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta));
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('text_value')) {
      context.handle(_textValueMeta,
          textValue.isAcceptableOrUnknown(data['text_value']!, _textValueMeta));
    } else if (isInserting) {
      context.missing(_textValueMeta);
    }
    if (data.containsKey('weight_value')) {
      context.handle(
          _weightValueMeta,
          weightValue.isAcceptableOrUnknown(
              data['weight_value']!, _weightValueMeta));
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('is_cursiv')) {
      context.handle(_isCursivMeta,
          isCursiv.isAcceptableOrUnknown(data['is_cursiv']!, _isCursivMeta));
    } else if (isInserting) {
      context.missing(_isCursivMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteText map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteText(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id'])!,
      textValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_value'])!,
      weightValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight_value']),
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex'])!,
      isCursiv: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_cursiv'])!,
      textSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}text_size']),
    );
  }

  @override
  $NoteTextsTable createAlias(String alias) {
    return $NoteTextsTable(attachedDatabase, alias);
  }
}

class NoteText extends DataClass implements Insertable<NoteText> {
  final int id;
  final int noteId;
  final String textValue;
  final int? weightValue;
  final String colorHex;
  final bool isCursiv;
  final double? textSize;
  const NoteText(
      {required this.id,
      required this.noteId,
      required this.textValue,
      this.weightValue,
      required this.colorHex,
      required this.isCursiv,
      this.textSize});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note_id'] = Variable<int>(noteId);
    map['text_value'] = Variable<String>(textValue);
    if (!nullToAbsent || weightValue != null) {
      map['weight_value'] = Variable<int>(weightValue);
    }
    map['color_hex'] = Variable<String>(colorHex);
    map['is_cursiv'] = Variable<bool>(isCursiv);
    if (!nullToAbsent || textSize != null) {
      map['text_size'] = Variable<double>(textSize);
    }
    return map;
  }

  NoteTextsCompanion toCompanion(bool nullToAbsent) {
    return NoteTextsCompanion(
      id: Value(id),
      noteId: Value(noteId),
      textValue: Value(textValue),
      weightValue: weightValue == null && nullToAbsent
          ? const Value.absent()
          : Value(weightValue),
      colorHex: Value(colorHex),
      isCursiv: Value(isCursiv),
      textSize: textSize == null && nullToAbsent
          ? const Value.absent()
          : Value(textSize),
    );
  }

  factory NoteText.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteText(
      id: serializer.fromJson<int>(json['id']),
      noteId: serializer.fromJson<int>(json['noteId']),
      textValue: serializer.fromJson<String>(json['textValue']),
      weightValue: serializer.fromJson<int?>(json['weightValue']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      isCursiv: serializer.fromJson<bool>(json['isCursiv']),
      textSize: serializer.fromJson<double?>(json['textSize']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'noteId': serializer.toJson<int>(noteId),
      'textValue': serializer.toJson<String>(textValue),
      'weightValue': serializer.toJson<int?>(weightValue),
      'colorHex': serializer.toJson<String>(colorHex),
      'isCursiv': serializer.toJson<bool>(isCursiv),
      'textSize': serializer.toJson<double?>(textSize),
    };
  }

  NoteText copyWith(
          {int? id,
          int? noteId,
          String? textValue,
          Value<int?> weightValue = const Value.absent(),
          String? colorHex,
          bool? isCursiv,
          Value<double?> textSize = const Value.absent()}) =>
      NoteText(
        id: id ?? this.id,
        noteId: noteId ?? this.noteId,
        textValue: textValue ?? this.textValue,
        weightValue: weightValue.present ? weightValue.value : this.weightValue,
        colorHex: colorHex ?? this.colorHex,
        isCursiv: isCursiv ?? this.isCursiv,
        textSize: textSize.present ? textSize.value : this.textSize,
      );
  NoteText copyWithCompanion(NoteTextsCompanion data) {
    return NoteText(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      textValue: data.textValue.present ? data.textValue.value : this.textValue,
      weightValue:
          data.weightValue.present ? data.weightValue.value : this.weightValue,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      isCursiv: data.isCursiv.present ? data.isCursiv.value : this.isCursiv,
      textSize: data.textSize.present ? data.textSize.value : this.textSize,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteText(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('textValue: $textValue, ')
          ..write('weightValue: $weightValue, ')
          ..write('colorHex: $colorHex, ')
          ..write('isCursiv: $isCursiv, ')
          ..write('textSize: $textSize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, noteId, textValue, weightValue, colorHex, isCursiv, textSize);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteText &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.textValue == this.textValue &&
          other.weightValue == this.weightValue &&
          other.colorHex == this.colorHex &&
          other.isCursiv == this.isCursiv &&
          other.textSize == this.textSize);
}

class NoteTextsCompanion extends UpdateCompanion<NoteText> {
  final Value<int> id;
  final Value<int> noteId;
  final Value<String> textValue;
  final Value<int?> weightValue;
  final Value<String> colorHex;
  final Value<bool> isCursiv;
  final Value<double?> textSize;
  const NoteTextsCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.textValue = const Value.absent(),
    this.weightValue = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.isCursiv = const Value.absent(),
    this.textSize = const Value.absent(),
  });
  NoteTextsCompanion.insert({
    this.id = const Value.absent(),
    required int noteId,
    required String textValue,
    this.weightValue = const Value.absent(),
    required String colorHex,
    required bool isCursiv,
    this.textSize = const Value.absent(),
  })  : noteId = Value(noteId),
        textValue = Value(textValue),
        colorHex = Value(colorHex),
        isCursiv = Value(isCursiv);
  static Insertable<NoteText> custom({
    Expression<int>? id,
    Expression<int>? noteId,
    Expression<String>? textValue,
    Expression<int>? weightValue,
    Expression<String>? colorHex,
    Expression<bool>? isCursiv,
    Expression<double>? textSize,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (textValue != null) 'text_value': textValue,
      if (weightValue != null) 'weight_value': weightValue,
      if (colorHex != null) 'color_hex': colorHex,
      if (isCursiv != null) 'is_cursiv': isCursiv,
      if (textSize != null) 'text_size': textSize,
    });
  }

  NoteTextsCompanion copyWith(
      {Value<int>? id,
      Value<int>? noteId,
      Value<String>? textValue,
      Value<int?>? weightValue,
      Value<String>? colorHex,
      Value<bool>? isCursiv,
      Value<double?>? textSize}) {
    return NoteTextsCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      textValue: textValue ?? this.textValue,
      weightValue: weightValue ?? this.weightValue,
      colorHex: colorHex ?? this.colorHex,
      isCursiv: isCursiv ?? this.isCursiv,
      textSize: textSize ?? this.textSize,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (textValue.present) {
      map['text_value'] = Variable<String>(textValue.value);
    }
    if (weightValue.present) {
      map['weight_value'] = Variable<int>(weightValue.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (isCursiv.present) {
      map['is_cursiv'] = Variable<bool>(isCursiv.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTextsCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('textValue: $textValue, ')
          ..write('weightValue: $weightValue, ')
          ..write('colorHex: $colorHex, ')
          ..write('isCursiv: $isCursiv, ')
          ..write('textSize: $textSize')
          ..write(')'))
        .toString();
  }
}

class $NoteLinearTable extends NoteLinear
    with TableInfo<$NoteLinearTable, NoteLinearData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteLinearTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _strokeWidthMeta =
      const VerificationMeta('strokeWidth');
  @override
  late final GeneratedColumn<double> strokeWidth = GeneratedColumn<double>(
      'stroke_width', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dxPositionMeta =
      const VerificationMeta('dxPosition');
  @override
  late final GeneratedColumn<double> dxPosition = GeneratedColumn<double>(
      'dx_position', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dyPositionMeta =
      const VerificationMeta('dyPosition');
  @override
  late final GeneratedColumn<double> dyPosition = GeneratedColumn<double>(
      'dy_position', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, strokeWidth, colorHex, noteId, dxPosition, dyPosition];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_linear';
  @override
  VerificationContext validateIntegrity(Insertable<NoteLinearData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stroke_width')) {
      context.handle(
          _strokeWidthMeta,
          strokeWidth.isAcceptableOrUnknown(
              data['stroke_width']!, _strokeWidthMeta));
    } else if (isInserting) {
      context.missing(_strokeWidthMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(_noteIdMeta,
          noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta));
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('dx_position')) {
      context.handle(
          _dxPositionMeta,
          dxPosition.isAcceptableOrUnknown(
              data['dx_position']!, _dxPositionMeta));
    } else if (isInserting) {
      context.missing(_dxPositionMeta);
    }
    if (data.containsKey('dy_position')) {
      context.handle(
          _dyPositionMeta,
          dyPosition.isAcceptableOrUnknown(
              data['dy_position']!, _dyPositionMeta));
    } else if (isInserting) {
      context.missing(_dyPositionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteLinearData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteLinearData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      strokeWidth: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stroke_width'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id'])!,
      dxPosition: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dx_position'])!,
      dyPosition: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dy_position'])!,
    );
  }

  @override
  $NoteLinearTable createAlias(String alias) {
    return $NoteLinearTable(attachedDatabase, alias);
  }
}

class NoteLinearData extends DataClass implements Insertable<NoteLinearData> {
  final int id;
  final double strokeWidth;
  final String colorHex;
  final int noteId;
  final double dxPosition;
  final double dyPosition;
  const NoteLinearData(
      {required this.id,
      required this.strokeWidth,
      required this.colorHex,
      required this.noteId,
      required this.dxPosition,
      required this.dyPosition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stroke_width'] = Variable<double>(strokeWidth);
    map['color_hex'] = Variable<String>(colorHex);
    map['note_id'] = Variable<int>(noteId);
    map['dx_position'] = Variable<double>(dxPosition);
    map['dy_position'] = Variable<double>(dyPosition);
    return map;
  }

  NoteLinearCompanion toCompanion(bool nullToAbsent) {
    return NoteLinearCompanion(
      id: Value(id),
      strokeWidth: Value(strokeWidth),
      colorHex: Value(colorHex),
      noteId: Value(noteId),
      dxPosition: Value(dxPosition),
      dyPosition: Value(dyPosition),
    );
  }

  factory NoteLinearData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteLinearData(
      id: serializer.fromJson<int>(json['id']),
      strokeWidth: serializer.fromJson<double>(json['strokeWidth']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      noteId: serializer.fromJson<int>(json['noteId']),
      dxPosition: serializer.fromJson<double>(json['dxPosition']),
      dyPosition: serializer.fromJson<double>(json['dyPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'strokeWidth': serializer.toJson<double>(strokeWidth),
      'colorHex': serializer.toJson<String>(colorHex),
      'noteId': serializer.toJson<int>(noteId),
      'dxPosition': serializer.toJson<double>(dxPosition),
      'dyPosition': serializer.toJson<double>(dyPosition),
    };
  }

  NoteLinearData copyWith(
          {int? id,
          double? strokeWidth,
          String? colorHex,
          int? noteId,
          double? dxPosition,
          double? dyPosition}) =>
      NoteLinearData(
        id: id ?? this.id,
        strokeWidth: strokeWidth ?? this.strokeWidth,
        colorHex: colorHex ?? this.colorHex,
        noteId: noteId ?? this.noteId,
        dxPosition: dxPosition ?? this.dxPosition,
        dyPosition: dyPosition ?? this.dyPosition,
      );
  NoteLinearData copyWithCompanion(NoteLinearCompanion data) {
    return NoteLinearData(
      id: data.id.present ? data.id.value : this.id,
      strokeWidth:
          data.strokeWidth.present ? data.strokeWidth.value : this.strokeWidth,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      dxPosition:
          data.dxPosition.present ? data.dxPosition.value : this.dxPosition,
      dyPosition:
          data.dyPosition.present ? data.dyPosition.value : this.dyPosition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteLinearData(')
          ..write('id: $id, ')
          ..write('strokeWidth: $strokeWidth, ')
          ..write('colorHex: $colorHex, ')
          ..write('noteId: $noteId, ')
          ..write('dxPosition: $dxPosition, ')
          ..write('dyPosition: $dyPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, strokeWidth, colorHex, noteId, dxPosition, dyPosition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteLinearData &&
          other.id == this.id &&
          other.strokeWidth == this.strokeWidth &&
          other.colorHex == this.colorHex &&
          other.noteId == this.noteId &&
          other.dxPosition == this.dxPosition &&
          other.dyPosition == this.dyPosition);
}

class NoteLinearCompanion extends UpdateCompanion<NoteLinearData> {
  final Value<int> id;
  final Value<double> strokeWidth;
  final Value<String> colorHex;
  final Value<int> noteId;
  final Value<double> dxPosition;
  final Value<double> dyPosition;
  const NoteLinearCompanion({
    this.id = const Value.absent(),
    this.strokeWidth = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.noteId = const Value.absent(),
    this.dxPosition = const Value.absent(),
    this.dyPosition = const Value.absent(),
  });
  NoteLinearCompanion.insert({
    this.id = const Value.absent(),
    required double strokeWidth,
    required String colorHex,
    required int noteId,
    required double dxPosition,
    required double dyPosition,
  })  : strokeWidth = Value(strokeWidth),
        colorHex = Value(colorHex),
        noteId = Value(noteId),
        dxPosition = Value(dxPosition),
        dyPosition = Value(dyPosition);
  static Insertable<NoteLinearData> custom({
    Expression<int>? id,
    Expression<double>? strokeWidth,
    Expression<String>? colorHex,
    Expression<int>? noteId,
    Expression<double>? dxPosition,
    Expression<double>? dyPosition,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (strokeWidth != null) 'stroke_width': strokeWidth,
      if (colorHex != null) 'color_hex': colorHex,
      if (noteId != null) 'note_id': noteId,
      if (dxPosition != null) 'dx_position': dxPosition,
      if (dyPosition != null) 'dy_position': dyPosition,
    });
  }

  NoteLinearCompanion copyWith(
      {Value<int>? id,
      Value<double>? strokeWidth,
      Value<String>? colorHex,
      Value<int>? noteId,
      Value<double>? dxPosition,
      Value<double>? dyPosition}) {
    return NoteLinearCompanion(
      id: id ?? this.id,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      colorHex: colorHex ?? this.colorHex,
      noteId: noteId ?? this.noteId,
      dxPosition: dxPosition ?? this.dxPosition,
      dyPosition: dyPosition ?? this.dyPosition,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (strokeWidth.present) {
      map['stroke_width'] = Variable<double>(strokeWidth.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (dxPosition.present) {
      map['dx_position'] = Variable<double>(dxPosition.value);
    }
    if (dyPosition.present) {
      map['dy_position'] = Variable<double>(dyPosition.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteLinearCompanion(')
          ..write('id: $id, ')
          ..write('strokeWidth: $strokeWidth, ')
          ..write('colorHex: $colorHex, ')
          ..write('noteId: $noteId, ')
          ..write('dxPosition: $dxPosition, ')
          ..write('dyPosition: $dyPosition')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlPathMeta =
      const VerificationMeta('urlPath');
  @override
  late final GeneratedColumn<String> urlPath = GeneratedColumn<String>(
      'url_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, urlPath, localPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(Insertable<Image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url_path')) {
      context.handle(_urlPathMeta,
          urlPath.isAcceptableOrUnknown(data['url_path']!, _urlPathMeta));
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Image(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      urlPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_path']),
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path']),
    );
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class Image extends DataClass implements Insertable<Image> {
  final int id;
  final String? urlPath;
  final String? localPath;
  const Image({required this.id, this.urlPath, this.localPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || urlPath != null) {
      map['url_path'] = Variable<String>(urlPath);
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: Value(id),
      urlPath: urlPath == null && nullToAbsent
          ? const Value.absent()
          : Value(urlPath),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
    );
  }

  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      id: serializer.fromJson<int>(json['id']),
      urlPath: serializer.fromJson<String?>(json['urlPath']),
      localPath: serializer.fromJson<String?>(json['localPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'urlPath': serializer.toJson<String?>(urlPath),
      'localPath': serializer.toJson<String?>(localPath),
    };
  }

  Image copyWith(
          {int? id,
          Value<String?> urlPath = const Value.absent(),
          Value<String?> localPath = const Value.absent()}) =>
      Image(
        id: id ?? this.id,
        urlPath: urlPath.present ? urlPath.value : this.urlPath,
        localPath: localPath.present ? localPath.value : this.localPath,
      );
  Image copyWithCompanion(ImagesCompanion data) {
    return Image(
      id: data.id.present ? data.id.value : this.id,
      urlPath: data.urlPath.present ? data.urlPath.value : this.urlPath,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('id: $id, ')
          ..write('urlPath: $urlPath, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, urlPath, localPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.id == this.id &&
          other.urlPath == this.urlPath &&
          other.localPath == this.localPath);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> id;
  final Value<String?> urlPath;
  final Value<String?> localPath;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.urlPath = const Value.absent(),
    this.localPath = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.id = const Value.absent(),
    this.urlPath = const Value.absent(),
    this.localPath = const Value.absent(),
  });
  static Insertable<Image> custom({
    Expression<int>? id,
    Expression<String>? urlPath,
    Expression<String>? localPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (urlPath != null) 'url_path': urlPath,
      if (localPath != null) 'local_path': localPath,
    });
  }

  ImagesCompanion copyWith(
      {Value<int>? id, Value<String?>? urlPath, Value<String?>? localPath}) {
    return ImagesCompanion(
      id: id ?? this.id,
      urlPath: urlPath ?? this.urlPath,
      localPath: localPath ?? this.localPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (urlPath.present) {
      map['url_path'] = Variable<String>(urlPath.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('id: $id, ')
          ..write('urlPath: $urlPath, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }
}

class $PositionsTable extends Positions
    with TableInfo<$PositionsTable, Position> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PositionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _positionTypeMeta =
      const VerificationMeta('positionType');
  @override
  late final GeneratedColumn<String> positionType = GeneratedColumn<String>(
      'position_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dxMeta = const VerificationMeta('dx');
  @override
  late final GeneratedColumn<double> dx = GeneratedColumn<double>(
      'dx', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dyMeta = const VerificationMeta('dy');
  @override
  late final GeneratedColumn<double> dy = GeneratedColumn<double>(
      'dy', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rotateMeta = const VerificationMeta('rotate');
  @override
  late final GeneratedColumn<double> rotate = GeneratedColumn<double>(
      'rotate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _scaleXMeta = const VerificationMeta('scaleX');
  @override
  late final GeneratedColumn<double> scaleX = GeneratedColumn<double>(
      'scale_x', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _scaleYMeta = const VerificationMeta('scaleY');
  @override
  late final GeneratedColumn<double> scaleY = GeneratedColumn<double>(
      'scale_y', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _opacityMeta =
      const VerificationMeta('opacity');
  @override
  late final GeneratedColumn<double> opacity = GeneratedColumn<double>(
      'opacity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: DateTime.now);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: DateTime.now);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentId,
        positionType,
        dx,
        dy,
        rotate,
        scaleX,
        scaleY,
        opacity,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'positions';
  @override
  VerificationContext validateIntegrity(Insertable<Position> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('position_type')) {
      context.handle(
          _positionTypeMeta,
          positionType.isAcceptableOrUnknown(
              data['position_type']!, _positionTypeMeta));
    }
    if (data.containsKey('dx')) {
      context.handle(_dxMeta, dx.isAcceptableOrUnknown(data['dx']!, _dxMeta));
    } else if (isInserting) {
      context.missing(_dxMeta);
    }
    if (data.containsKey('dy')) {
      context.handle(_dyMeta, dy.isAcceptableOrUnknown(data['dy']!, _dyMeta));
    } else if (isInserting) {
      context.missing(_dyMeta);
    }
    if (data.containsKey('rotate')) {
      context.handle(_rotateMeta,
          rotate.isAcceptableOrUnknown(data['rotate']!, _rotateMeta));
    } else if (isInserting) {
      context.missing(_rotateMeta);
    }
    if (data.containsKey('scale_x')) {
      context.handle(_scaleXMeta,
          scaleX.isAcceptableOrUnknown(data['scale_x']!, _scaleXMeta));
    } else if (isInserting) {
      context.missing(_scaleXMeta);
    }
    if (data.containsKey('scale_y')) {
      context.handle(_scaleYMeta,
          scaleY.isAcceptableOrUnknown(data['scale_y']!, _scaleYMeta));
    } else if (isInserting) {
      context.missing(_scaleYMeta);
    }
    if (data.containsKey('opacity')) {
      context.handle(_opacityMeta,
          opacity.isAcceptableOrUnknown(data['opacity']!, _opacityMeta));
    } else if (isInserting) {
      context.missing(_opacityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Position map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Position(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      positionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position_type']),
      dx: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dx'])!,
      dy: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dy'])!,
      rotate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rotate'])!,
      scaleX: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}scale_x'])!,
      scaleY: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}scale_y'])!,
      opacity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}opacity'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PositionsTable createAlias(String alias) {
    return $PositionsTable(attachedDatabase, alias);
  }
}

class Position extends DataClass implements Insertable<Position> {
  final int id;
  final int parentId;
  final String? positionType;
  final double dx;
  final double dy;
  final double rotate;
  final double scaleX;
  final double scaleY;
  final double opacity;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Position(
      {required this.id,
      required this.parentId,
      this.positionType,
      required this.dx,
      required this.dy,
      required this.rotate,
      required this.scaleX,
      required this.scaleY,
      required this.opacity,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<int>(parentId);
    if (!nullToAbsent || positionType != null) {
      map['position_type'] = Variable<String>(positionType);
    }
    map['dx'] = Variable<double>(dx);
    map['dy'] = Variable<double>(dy);
    map['rotate'] = Variable<double>(rotate);
    map['scale_x'] = Variable<double>(scaleX);
    map['scale_y'] = Variable<double>(scaleY);
    map['opacity'] = Variable<double>(opacity);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PositionsCompanion toCompanion(bool nullToAbsent) {
    return PositionsCompanion(
      id: Value(id),
      parentId: Value(parentId),
      positionType: positionType == null && nullToAbsent
          ? const Value.absent()
          : Value(positionType),
      dx: Value(dx),
      dy: Value(dy),
      rotate: Value(rotate),
      scaleX: Value(scaleX),
      scaleY: Value(scaleY),
      opacity: Value(opacity),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Position.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Position(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<int>(json['parentId']),
      positionType: serializer.fromJson<String?>(json['positionType']),
      dx: serializer.fromJson<double>(json['dx']),
      dy: serializer.fromJson<double>(json['dy']),
      rotate: serializer.fromJson<double>(json['rotate']),
      scaleX: serializer.fromJson<double>(json['scaleX']),
      scaleY: serializer.fromJson<double>(json['scaleY']),
      opacity: serializer.fromJson<double>(json['opacity']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<int>(parentId),
      'positionType': serializer.toJson<String?>(positionType),
      'dx': serializer.toJson<double>(dx),
      'dy': serializer.toJson<double>(dy),
      'rotate': serializer.toJson<double>(rotate),
      'scaleX': serializer.toJson<double>(scaleX),
      'scaleY': serializer.toJson<double>(scaleY),
      'opacity': serializer.toJson<double>(opacity),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Position copyWith(
          {int? id,
          int? parentId,
          Value<String?> positionType = const Value.absent(),
          double? dx,
          double? dy,
          double? rotate,
          double? scaleX,
          double? scaleY,
          double? opacity,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Position(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        positionType:
            positionType.present ? positionType.value : this.positionType,
        dx: dx ?? this.dx,
        dy: dy ?? this.dy,
        rotate: rotate ?? this.rotate,
        scaleX: scaleX ?? this.scaleX,
        scaleY: scaleY ?? this.scaleY,
        opacity: opacity ?? this.opacity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Position copyWithCompanion(PositionsCompanion data) {
    return Position(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      positionType: data.positionType.present
          ? data.positionType.value
          : this.positionType,
      dx: data.dx.present ? data.dx.value : this.dx,
      dy: data.dy.present ? data.dy.value : this.dy,
      rotate: data.rotate.present ? data.rotate.value : this.rotate,
      scaleX: data.scaleX.present ? data.scaleX.value : this.scaleX,
      scaleY: data.scaleY.present ? data.scaleY.value : this.scaleY,
      opacity: data.opacity.present ? data.opacity.value : this.opacity,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Position(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('positionType: $positionType, ')
          ..write('dx: $dx, ')
          ..write('dy: $dy, ')
          ..write('rotate: $rotate, ')
          ..write('scaleX: $scaleX, ')
          ..write('scaleY: $scaleY, ')
          ..write('opacity: $opacity, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parentId, positionType, dx, dy, rotate,
      scaleX, scaleY, opacity, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Position &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.positionType == this.positionType &&
          other.dx == this.dx &&
          other.dy == this.dy &&
          other.rotate == this.rotate &&
          other.scaleX == this.scaleX &&
          other.scaleY == this.scaleY &&
          other.opacity == this.opacity &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PositionsCompanion extends UpdateCompanion<Position> {
  final Value<int> id;
  final Value<int> parentId;
  final Value<String?> positionType;
  final Value<double> dx;
  final Value<double> dy;
  final Value<double> rotate;
  final Value<double> scaleX;
  final Value<double> scaleY;
  final Value<double> opacity;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PositionsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.positionType = const Value.absent(),
    this.dx = const Value.absent(),
    this.dy = const Value.absent(),
    this.rotate = const Value.absent(),
    this.scaleX = const Value.absent(),
    this.scaleY = const Value.absent(),
    this.opacity = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PositionsCompanion.insert({
    this.id = const Value.absent(),
    required int parentId,
    this.positionType = const Value.absent(),
    required double dx,
    required double dy,
    required double rotate,
    required double scaleX,
    required double scaleY,
    required double opacity,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : parentId = Value(parentId),
        dx = Value(dx),
        dy = Value(dy),
        rotate = Value(rotate),
        scaleX = Value(scaleX),
        scaleY = Value(scaleY),
        opacity = Value(opacity);
  static Insertable<Position> custom({
    Expression<int>? id,
    Expression<int>? parentId,
    Expression<String>? positionType,
    Expression<double>? dx,
    Expression<double>? dy,
    Expression<double>? rotate,
    Expression<double>? scaleX,
    Expression<double>? scaleY,
    Expression<double>? opacity,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (positionType != null) 'position_type': positionType,
      if (dx != null) 'dx': dx,
      if (dy != null) 'dy': dy,
      if (rotate != null) 'rotate': rotate,
      if (scaleX != null) 'scale_x': scaleX,
      if (scaleY != null) 'scale_y': scaleY,
      if (opacity != null) 'opacity': opacity,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PositionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? parentId,
      Value<String?>? positionType,
      Value<double>? dx,
      Value<double>? dy,
      Value<double>? rotate,
      Value<double>? scaleX,
      Value<double>? scaleY,
      Value<double>? opacity,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return PositionsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      positionType: positionType ?? this.positionType,
      dx: dx ?? this.dx,
      dy: dy ?? this.dy,
      rotate: rotate ?? this.rotate,
      scaleX: scaleX ?? this.scaleX,
      scaleY: scaleY ?? this.scaleY,
      opacity: opacity ?? this.opacity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (positionType.present) {
      map['position_type'] = Variable<String>(positionType.value);
    }
    if (dx.present) {
      map['dx'] = Variable<double>(dx.value);
    }
    if (dy.present) {
      map['dy'] = Variable<double>(dy.value);
    }
    if (rotate.present) {
      map['rotate'] = Variable<double>(rotate.value);
    }
    if (scaleX.present) {
      map['scale_x'] = Variable<double>(scaleX.value);
    }
    if (scaleY.present) {
      map['scale_y'] = Variable<double>(scaleY.value);
    }
    if (opacity.present) {
      map['opacity'] = Variable<double>(opacity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PositionsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('positionType: $positionType, ')
          ..write('dx: $dx, ')
          ..write('dy: $dy, ')
          ..write('rotate: $rotate, ')
          ..write('scaleX: $scaleX, ')
          ..write('scaleY: $scaleY, ')
          ..write('opacity: $opacity, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $CategoryNotesTable categoryNotes = $CategoryNotesTable(this);
  late final $SubNotesTable subNotes = $SubNotesTable(this);
  late final $NoteTextsTable noteTexts = $NoteTextsTable(this);
  late final $NoteLinearTable noteLinear = $NoteLinearTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $PositionsTable positions = $PositionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        notes,
        categoryNotes,
        subNotes,
        noteTexts,
        noteLinear,
        images,
        positions
      ];
}

typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  required String category,
  required bool isFavourite,
  Value<DateTime> createdTime,
  Value<DateTime?> updatedTime,
  Value<DateTime?> deletedTime,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  Value<String> category,
  Value<bool> isFavourite,
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

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);

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
            Value<String> category = const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
            Value<DateTime> createdTime = const Value.absent(),
            Value<DateTime?> updatedTime = const Value.absent(),
            Value<DateTime?> deletedTime = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            category: category,
            isFavourite: isFavourite,
            createdTime: createdTime,
            updatedTime: updatedTime,
            deletedTime: deletedTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String category,
            required bool isFavourite,
            Value<DateTime> createdTime = const Value.absent(),
            Value<DateTime?> updatedTime = const Value.absent(),
            Value<DateTime?> deletedTime = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            category: category,
            isFavourite: isFavourite,
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
typedef $$SubNotesTableCreateCompanionBuilder = SubNotesCompanion Function({
  Value<int> id,
  required String description,
  required int parentId,
  Value<String?> comment,
  Value<int?> importanceValue,
});
typedef $$SubNotesTableUpdateCompanionBuilder = SubNotesCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<int> parentId,
  Value<String?> comment,
  Value<int?> importanceValue,
});

class $$SubNotesTableFilterComposer
    extends Composer<_$AppDatabase, $SubNotesTable> {
  $$SubNotesTableFilterComposer({
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

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get importanceValue => $composableBuilder(
      column: $table.importanceValue,
      builder: (column) => ColumnFilters(column));
}

class $$SubNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $SubNotesTable> {
  $$SubNotesTableOrderingComposer({
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

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get importanceValue => $composableBuilder(
      column: $table.importanceValue,
      builder: (column) => ColumnOrderings(column));
}

class $$SubNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubNotesTable> {
  $$SubNotesTableAnnotationComposer({
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

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get importanceValue => $composableBuilder(
      column: $table.importanceValue, builder: (column) => column);
}

class $$SubNotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubNotesTable,
    SubNote,
    $$SubNotesTableFilterComposer,
    $$SubNotesTableOrderingComposer,
    $$SubNotesTableAnnotationComposer,
    $$SubNotesTableCreateCompanionBuilder,
    $$SubNotesTableUpdateCompanionBuilder,
    (SubNote, BaseReferences<_$AppDatabase, $SubNotesTable, SubNote>),
    SubNote,
    PrefetchHooks Function()> {
  $$SubNotesTableTableManager(_$AppDatabase db, $SubNotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> parentId = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<int?> importanceValue = const Value.absent(),
          }) =>
              SubNotesCompanion(
            id: id,
            description: description,
            parentId: parentId,
            comment: comment,
            importanceValue: importanceValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required int parentId,
            Value<String?> comment = const Value.absent(),
            Value<int?> importanceValue = const Value.absent(),
          }) =>
              SubNotesCompanion.insert(
            id: id,
            description: description,
            parentId: parentId,
            comment: comment,
            importanceValue: importanceValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubNotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubNotesTable,
    SubNote,
    $$SubNotesTableFilterComposer,
    $$SubNotesTableOrderingComposer,
    $$SubNotesTableAnnotationComposer,
    $$SubNotesTableCreateCompanionBuilder,
    $$SubNotesTableUpdateCompanionBuilder,
    (SubNote, BaseReferences<_$AppDatabase, $SubNotesTable, SubNote>),
    SubNote,
    PrefetchHooks Function()>;
typedef $$NoteTextsTableCreateCompanionBuilder = NoteTextsCompanion Function({
  Value<int> id,
  required int noteId,
  required String textValue,
  Value<int?> weightValue,
  required String colorHex,
  required bool isCursiv,
  Value<double?> textSize,
});
typedef $$NoteTextsTableUpdateCompanionBuilder = NoteTextsCompanion Function({
  Value<int> id,
  Value<int> noteId,
  Value<String> textValue,
  Value<int?> weightValue,
  Value<String> colorHex,
  Value<bool> isCursiv,
  Value<double?> textSize,
});

class $$NoteTextsTableFilterComposer
    extends Composer<_$AppDatabase, $NoteTextsTable> {
  $$NoteTextsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get noteId => $composableBuilder(
      column: $table.noteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textValue => $composableBuilder(
      column: $table.textValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weightValue => $composableBuilder(
      column: $table.weightValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCursiv => $composableBuilder(
      column: $table.isCursiv, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get textSize => $composableBuilder(
      column: $table.textSize, builder: (column) => ColumnFilters(column));
}

class $$NoteTextsTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteTextsTable> {
  $$NoteTextsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get noteId => $composableBuilder(
      column: $table.noteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textValue => $composableBuilder(
      column: $table.textValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weightValue => $composableBuilder(
      column: $table.weightValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCursiv => $composableBuilder(
      column: $table.isCursiv, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get textSize => $composableBuilder(
      column: $table.textSize, builder: (column) => ColumnOrderings(column));
}

class $$NoteTextsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTextsTable> {
  $$NoteTextsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get noteId =>
      $composableBuilder(column: $table.noteId, builder: (column) => column);

  GeneratedColumn<String> get textValue =>
      $composableBuilder(column: $table.textValue, builder: (column) => column);

  GeneratedColumn<int> get weightValue => $composableBuilder(
      column: $table.weightValue, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<bool> get isCursiv =>
      $composableBuilder(column: $table.isCursiv, builder: (column) => column);

  GeneratedColumn<double> get textSize =>
      $composableBuilder(column: $table.textSize, builder: (column) => column);
}

class $$NoteTextsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteTextsTable,
    NoteText,
    $$NoteTextsTableFilterComposer,
    $$NoteTextsTableOrderingComposer,
    $$NoteTextsTableAnnotationComposer,
    $$NoteTextsTableCreateCompanionBuilder,
    $$NoteTextsTableUpdateCompanionBuilder,
    (NoteText, BaseReferences<_$AppDatabase, $NoteTextsTable, NoteText>),
    NoteText,
    PrefetchHooks Function()> {
  $$NoteTextsTableTableManager(_$AppDatabase db, $NoteTextsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTextsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTextsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTextsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> noteId = const Value.absent(),
            Value<String> textValue = const Value.absent(),
            Value<int?> weightValue = const Value.absent(),
            Value<String> colorHex = const Value.absent(),
            Value<bool> isCursiv = const Value.absent(),
            Value<double?> textSize = const Value.absent(),
          }) =>
              NoteTextsCompanion(
            id: id,
            noteId: noteId,
            textValue: textValue,
            weightValue: weightValue,
            colorHex: colorHex,
            isCursiv: isCursiv,
            textSize: textSize,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int noteId,
            required String textValue,
            Value<int?> weightValue = const Value.absent(),
            required String colorHex,
            required bool isCursiv,
            Value<double?> textSize = const Value.absent(),
          }) =>
              NoteTextsCompanion.insert(
            id: id,
            noteId: noteId,
            textValue: textValue,
            weightValue: weightValue,
            colorHex: colorHex,
            isCursiv: isCursiv,
            textSize: textSize,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NoteTextsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoteTextsTable,
    NoteText,
    $$NoteTextsTableFilterComposer,
    $$NoteTextsTableOrderingComposer,
    $$NoteTextsTableAnnotationComposer,
    $$NoteTextsTableCreateCompanionBuilder,
    $$NoteTextsTableUpdateCompanionBuilder,
    (NoteText, BaseReferences<_$AppDatabase, $NoteTextsTable, NoteText>),
    NoteText,
    PrefetchHooks Function()>;
typedef $$NoteLinearTableCreateCompanionBuilder = NoteLinearCompanion Function({
  Value<int> id,
  required double strokeWidth,
  required String colorHex,
  required int noteId,
  required double dxPosition,
  required double dyPosition,
});
typedef $$NoteLinearTableUpdateCompanionBuilder = NoteLinearCompanion Function({
  Value<int> id,
  Value<double> strokeWidth,
  Value<String> colorHex,
  Value<int> noteId,
  Value<double> dxPosition,
  Value<double> dyPosition,
});

class $$NoteLinearTableFilterComposer
    extends Composer<_$AppDatabase, $NoteLinearTable> {
  $$NoteLinearTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get strokeWidth => $composableBuilder(
      column: $table.strokeWidth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get noteId => $composableBuilder(
      column: $table.noteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dxPosition => $composableBuilder(
      column: $table.dxPosition, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dyPosition => $composableBuilder(
      column: $table.dyPosition, builder: (column) => ColumnFilters(column));
}

class $$NoteLinearTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteLinearTable> {
  $$NoteLinearTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get strokeWidth => $composableBuilder(
      column: $table.strokeWidth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get noteId => $composableBuilder(
      column: $table.noteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dxPosition => $composableBuilder(
      column: $table.dxPosition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dyPosition => $composableBuilder(
      column: $table.dyPosition, builder: (column) => ColumnOrderings(column));
}

class $$NoteLinearTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteLinearTable> {
  $$NoteLinearTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get strokeWidth => $composableBuilder(
      column: $table.strokeWidth, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<int> get noteId =>
      $composableBuilder(column: $table.noteId, builder: (column) => column);

  GeneratedColumn<double> get dxPosition => $composableBuilder(
      column: $table.dxPosition, builder: (column) => column);

  GeneratedColumn<double> get dyPosition => $composableBuilder(
      column: $table.dyPosition, builder: (column) => column);
}

class $$NoteLinearTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteLinearTable,
    NoteLinearData,
    $$NoteLinearTableFilterComposer,
    $$NoteLinearTableOrderingComposer,
    $$NoteLinearTableAnnotationComposer,
    $$NoteLinearTableCreateCompanionBuilder,
    $$NoteLinearTableUpdateCompanionBuilder,
    (
      NoteLinearData,
      BaseReferences<_$AppDatabase, $NoteLinearTable, NoteLinearData>
    ),
    NoteLinearData,
    PrefetchHooks Function()> {
  $$NoteLinearTableTableManager(_$AppDatabase db, $NoteLinearTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteLinearTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteLinearTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteLinearTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> strokeWidth = const Value.absent(),
            Value<String> colorHex = const Value.absent(),
            Value<int> noteId = const Value.absent(),
            Value<double> dxPosition = const Value.absent(),
            Value<double> dyPosition = const Value.absent(),
          }) =>
              NoteLinearCompanion(
            id: id,
            strokeWidth: strokeWidth,
            colorHex: colorHex,
            noteId: noteId,
            dxPosition: dxPosition,
            dyPosition: dyPosition,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double strokeWidth,
            required String colorHex,
            required int noteId,
            required double dxPosition,
            required double dyPosition,
          }) =>
              NoteLinearCompanion.insert(
            id: id,
            strokeWidth: strokeWidth,
            colorHex: colorHex,
            noteId: noteId,
            dxPosition: dxPosition,
            dyPosition: dyPosition,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NoteLinearTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoteLinearTable,
    NoteLinearData,
    $$NoteLinearTableFilterComposer,
    $$NoteLinearTableOrderingComposer,
    $$NoteLinearTableAnnotationComposer,
    $$NoteLinearTableCreateCompanionBuilder,
    $$NoteLinearTableUpdateCompanionBuilder,
    (
      NoteLinearData,
      BaseReferences<_$AppDatabase, $NoteLinearTable, NoteLinearData>
    ),
    NoteLinearData,
    PrefetchHooks Function()>;
typedef $$ImagesTableCreateCompanionBuilder = ImagesCompanion Function({
  Value<int> id,
  Value<String?> urlPath,
  Value<String?> localPath,
});
typedef $$ImagesTableUpdateCompanionBuilder = ImagesCompanion Function({
  Value<int> id,
  Value<String?> urlPath,
  Value<String?> localPath,
});

class $$ImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlPath => $composableBuilder(
      column: $table.urlPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));
}

class $$ImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlPath => $composableBuilder(
      column: $table.urlPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));
}

class $$ImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get urlPath =>
      $composableBuilder(column: $table.urlPath, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);
}

class $$ImagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImagesTable,
    Image,
    $$ImagesTableFilterComposer,
    $$ImagesTableOrderingComposer,
    $$ImagesTableAnnotationComposer,
    $$ImagesTableCreateCompanionBuilder,
    $$ImagesTableUpdateCompanionBuilder,
    (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
    Image,
    PrefetchHooks Function()> {
  $$ImagesTableTableManager(_$AppDatabase db, $ImagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> urlPath = const Value.absent(),
            Value<String?> localPath = const Value.absent(),
          }) =>
              ImagesCompanion(
            id: id,
            urlPath: urlPath,
            localPath: localPath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> urlPath = const Value.absent(),
            Value<String?> localPath = const Value.absent(),
          }) =>
              ImagesCompanion.insert(
            id: id,
            urlPath: urlPath,
            localPath: localPath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ImagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ImagesTable,
    Image,
    $$ImagesTableFilterComposer,
    $$ImagesTableOrderingComposer,
    $$ImagesTableAnnotationComposer,
    $$ImagesTableCreateCompanionBuilder,
    $$ImagesTableUpdateCompanionBuilder,
    (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
    Image,
    PrefetchHooks Function()>;
typedef $$PositionsTableCreateCompanionBuilder = PositionsCompanion Function({
  Value<int> id,
  required int parentId,
  Value<String?> positionType,
  required double dx,
  required double dy,
  required double rotate,
  required double scaleX,
  required double scaleY,
  required double opacity,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$PositionsTableUpdateCompanionBuilder = PositionsCompanion Function({
  Value<int> id,
  Value<int> parentId,
  Value<String?> positionType,
  Value<double> dx,
  Value<double> dy,
  Value<double> rotate,
  Value<double> scaleX,
  Value<double> scaleY,
  Value<double> opacity,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$PositionsTableFilterComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get positionType => $composableBuilder(
      column: $table.positionType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dx => $composableBuilder(
      column: $table.dx, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dy => $composableBuilder(
      column: $table.dy, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rotate => $composableBuilder(
      column: $table.rotate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get scaleX => $composableBuilder(
      column: $table.scaleX, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get scaleY => $composableBuilder(
      column: $table.scaleY, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get opacity => $composableBuilder(
      column: $table.opacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PositionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get positionType => $composableBuilder(
      column: $table.positionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dx => $composableBuilder(
      column: $table.dx, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dy => $composableBuilder(
      column: $table.dy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rotate => $composableBuilder(
      column: $table.rotate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get scaleX => $composableBuilder(
      column: $table.scaleX, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get scaleY => $composableBuilder(
      column: $table.scaleY, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get opacity => $composableBuilder(
      column: $table.opacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PositionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get positionType => $composableBuilder(
      column: $table.positionType, builder: (column) => column);

  GeneratedColumn<double> get dx =>
      $composableBuilder(column: $table.dx, builder: (column) => column);

  GeneratedColumn<double> get dy =>
      $composableBuilder(column: $table.dy, builder: (column) => column);

  GeneratedColumn<double> get rotate =>
      $composableBuilder(column: $table.rotate, builder: (column) => column);

  GeneratedColumn<double> get scaleX =>
      $composableBuilder(column: $table.scaleX, builder: (column) => column);

  GeneratedColumn<double> get scaleY =>
      $composableBuilder(column: $table.scaleY, builder: (column) => column);

  GeneratedColumn<double> get opacity =>
      $composableBuilder(column: $table.opacity, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PositionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PositionsTable,
    Position,
    $$PositionsTableFilterComposer,
    $$PositionsTableOrderingComposer,
    $$PositionsTableAnnotationComposer,
    $$PositionsTableCreateCompanionBuilder,
    $$PositionsTableUpdateCompanionBuilder,
    (Position, BaseReferences<_$AppDatabase, $PositionsTable, Position>),
    Position,
    PrefetchHooks Function()> {
  $$PositionsTableTableManager(_$AppDatabase db, $PositionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PositionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PositionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PositionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parentId = const Value.absent(),
            Value<String?> positionType = const Value.absent(),
            Value<double> dx = const Value.absent(),
            Value<double> dy = const Value.absent(),
            Value<double> rotate = const Value.absent(),
            Value<double> scaleX = const Value.absent(),
            Value<double> scaleY = const Value.absent(),
            Value<double> opacity = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PositionsCompanion(
            id: id,
            parentId: parentId,
            positionType: positionType,
            dx: dx,
            dy: dy,
            rotate: rotate,
            scaleX: scaleX,
            scaleY: scaleY,
            opacity: opacity,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parentId,
            Value<String?> positionType = const Value.absent(),
            required double dx,
            required double dy,
            required double rotate,
            required double scaleX,
            required double scaleY,
            required double opacity,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PositionsCompanion.insert(
            id: id,
            parentId: parentId,
            positionType: positionType,
            dx: dx,
            dy: dy,
            rotate: rotate,
            scaleX: scaleX,
            scaleY: scaleY,
            opacity: opacity,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PositionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PositionsTable,
    Position,
    $$PositionsTableFilterComposer,
    $$PositionsTableOrderingComposer,
    $$PositionsTableAnnotationComposer,
    $$PositionsTableCreateCompanionBuilder,
    $$PositionsTableUpdateCompanionBuilder,
    (Position, BaseReferences<_$AppDatabase, $PositionsTable, Position>),
    Position,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$CategoryNotesTableTableManager get categoryNotes =>
      $$CategoryNotesTableTableManager(_db, _db.categoryNotes);
  $$SubNotesTableTableManager get subNotes =>
      $$SubNotesTableTableManager(_db, _db.subNotes);
  $$NoteTextsTableTableManager get noteTexts =>
      $$NoteTextsTableTableManager(_db, _db.noteTexts);
  $$NoteLinearTableTableManager get noteLinear =>
      $$NoteLinearTableTableManager(_db, _db.noteLinear);
  $$ImagesTableTableManager get images =>
      $$ImagesTableTableManager(_db, _db.images);
  $$PositionsTableTableManager get positions =>
      $$PositionsTableTableManager(_db, _db.positions);
}
