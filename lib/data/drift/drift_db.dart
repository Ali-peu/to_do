import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:to_do/data/drift/const_drift_instanse.dart';
import 'package:to_do/domain/model/note.dart';

part 'drift_db.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()(); // id в вашем классе - строка
  TextColumn get description => text()();
  BoolColumn get isDone => boolean()();
  TextColumn get category => text()();
  BoolColumn get isThisStar => boolean()();
  DateTimeColumn get time => dateTime()();
  DateTimeColumn get replayTime1 => dateTime()();
  DateTimeColumn get replayTime2 => dateTime()();
}

class CategoryNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
}

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

class NoteDriftProvider extends AppDatabase {
  Future<int?> insertNote(NoteModel note) async {
    try {
      final id = await database.into(notes).insert(NoteModel.toCompanion(note));
      return id;
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<NoteModel?> readNote({required int id}) async {
    try {
      final note = await (select(notes)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
      if (note != null) {
        return NoteModel.fromCompanion(note);
      }
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<void> deleteNote({required int id}) async {
    try {
      await (delete(notes)..where((tbl) => tbl.id.equals(id))).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<void> deleteNotes() async {
    try {
      await (delete(notes)).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<NoteModel?> updateNote(NoteModel note) async {
    try {
      await (update(notes)..where((tbl) => tbl.id.equals(note.id)))
          .write(NoteModel.toCompanion(note));
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }
}

void logError(Object e, String name) {
  log(e.toString(), name: name);
}
