import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:to_do/model/note.dart';

class HiveDataBase {
  void saveNote(Note note) async {
    final box = await Hive.openBox<Note>('box');
    box.put(note.id, note);
  }

  void deleteNote(Note note) async {
    final box = await Hive.openBox<Note>('box');
    box.delete(note.id);
  }

  Future<List<Note>> chooseNotes(String category) async {
    final box = await Hive.openBox<Note>('box');
    List<Note> categoryNotes =
        box.values.where((element) => element.description == category).toList();
    return categoryNotes;
  }

  Future<void> update(Note note, String text) async {
    final box = await Hive.openBox<Note>('box');
    final updatingNote = box.get(note.id);

    updatingNote!.description = text;

    box.put(note.id, updatingNote);
  }

  Future<void> updateDatetime(Note note, DateTime taskDatetime) async {
    final box = await Hive.openBox<Note>('box');
    final updatingNote = box.get(note.id);

    updatingNote!.time = taskDatetime;

    box.put(note.id, updatingNote);
  }

  Future<void> isdone(Note note, bool noteIsDone) async {
    final box = await Hive.openBox<Note>('box');
    final updatingNote = box.get(note.id);
    updatingNote!.isDone = !noteIsDone;
    box.put(note.id, updatingNote);
  }

  Future<List<Note>> theThisDataNotes(DateTime selectedDay) async {
    final box = await Hive.openBox<Note>('box');
    final notes =
        box.values.where((element) => element.time == selectedDay).toList();
    return notes;
  }

  Future<void> starNote(Note note, bool noteIsStar) async {
    final box = await Hive.openBox<Note>('box');
    final updatingNote = box.get(note.id);
    updatingNote!.isThisStar = !noteIsStar;
    box.put(note.id, updatingNote);
    Fluttertoast.showToast(
        msg: updatingNote.isThisStar ? 'Задача добавлена' : 'Задача удалена',
        gravity: ToastGravity.BOTTOM);
  }
}
