import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'drift_db.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()(); // id в вашем классе - строка
  TextColumn get category => text()();
  BoolColumn get isFavourite => boolean()();
  DateTimeColumn get createdTime => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedTime => dateTime().nullable()();
  DateTimeColumn get deletedTime => dateTime().nullable()();
}

class SubNotes extends Table {
  IntColumn get id => integer().autoIncrement()(); // id в вашем классе - строка
  TextColumn get description => text()();
  IntColumn get parentId => integer()();
  TextColumn get comment => text().nullable()();
  IntColumn get importanceValue => integer().nullable()();
}

class NoteTexts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer()(); // ID родительской заметки
  TextColumn get description => text()();
  IntColumn get textStyle => integer()(); // 1=курсив, 2=жирный и т.д.
  TextColumn get colorHex => text()(); // HEX цвет текста
}

class NoteLinear extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get strokeWidth => integer()(); // Толщина линии
  TextColumn get colorHex => text()(); // HEX цвет линии
  IntColumn get noteId => integer()(); // ID родительской заметки
  TextColumn get dxPositions => text().nullable()(); // Сериализованный список dx
  TextColumn get dyPositions => text().nullable()(); // Сериализованный список dy
}

class Images extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get urlPath => text().nullable()(); // Ссылка на изображение
  TextColumn get localPath => text().nullable()(); // Локальный путь
}

class Positions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId =>
      integer()(); // ID родительского объекта (текст, линия, изображение)
  TextColumn get positionType => text().nullable()();
  RealColumn get dx => real()(); // X-координата
  RealColumn get dy => real()(); // Y-координата
  RealColumn get rotate => real()(); // Угол поворота
  RealColumn get scaleX => real()(); // Масштаб по X
  RealColumn get scaleY => real()(); // Масштаб по Y
  RealColumn get opacity => real()(); // Прозрачность
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class CategoryNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
}

@DriftDatabase(tables: [
  Notes,
  CategoryNotes,
  SubNotes,
  NoteTexts,
  NoteLinear,
  Images,
  Positions
])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'my_database');
  }
}


void logError(Object e, String name) {
  log(e.toString(), name: name);
}
