import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:to_do/model/note.dart';

class HiveDataBase {
  final box = Hive.box<Note>('box');
  void saveNote(Note note) async {
    box.put(note.id, note);
  }

  Future<void> deleteNote(Note note) async {
    box.delete(note.id);
  }

  Future<List<Note>> chooseNotes(String category) async {
    List<Note> categoryNotes =
        box.values.where((element) => element.description == category).toList();
    return categoryNotes;
  }

  Future<void> update(Note note, String text) async {
    final updatingNote = box.get(note.id);

    updatingNote!.description = text;

    box.put(note.id, updatingNote);
  }

  Future<void> updateDatetime(Note note, DateTime taskDatetime) async {
    final updatingNote = box.get(note.id);

    updatingNote!.time = taskDatetime;

    box.put(note.id, updatingNote);
  }

  Future<void> isdone(Note note, bool noteIsDone) async {
    final updatingNote = box.get(note.id);
    updatingNote!.isDone = !noteIsDone;
    box.put(note.id, updatingNote);
  }

  Future<List<Note>> theThisDataNotes(DateTime selectedDay) async {
    final notes =
        box.values.where((element) => element.time == selectedDay).toList();
    return notes;
  }

  Future<void> starNote(Note note, bool noteIsStar) async {
    final updatingNote = box.get(note.id);
    updatingNote!.isThisStar = !noteIsStar;
    box.put(note.id, updatingNote);
    Fluttertoast.showToast(
        msg: updatingNote.isThisStar ? 'Задача добавлена' : 'Задача удалена',
        gravity: ToastGravity.BOTTOM);
  }

  bool searchNoteWithCategory(String category) {
    if (box.values.where((e) => e.category == category).isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> updateReplayTime(Note note, String replayTime) async {
    final updatingNote = box.get(note.id);

    updatingNote!.replayTime = replayTime;

    box.put(note.id, updatingNote);
  }

  // Future<void> searchResults(String query) {
  //   box.values.where((element) =>
  //       element.description.toLowerCase().contains(query.toLowerCase()));
  // }
}
