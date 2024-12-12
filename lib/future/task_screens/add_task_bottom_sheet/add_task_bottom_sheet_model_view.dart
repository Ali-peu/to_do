import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/domain/model/note.dart';

class AddTaskBottomSheetModelView extends ChangeNotifier {
  final subtitle = TextEditingController();
  final categoryContoller = TextEditingController();

  final DriftDatebaseProviderForNote datebaseProviderForNote;

  DateTime? _selectedDeadlineTime = DateTime.now()..add(const Duration(minutes: 30));
  bool isDone = false;
  bool isThisStar = false;

  AddTaskBottomSheetModelView({required this.datebaseProviderForNote});
  int dropDownButtonValue = 1;

  void setNewNoteDate(DateTime? newDateTime) {
    _selectedDeadlineTime =  newDateTime ;
    notifyListeners();
  }

  Future<void> createNote() async {
    final NoteModel noteModel = NoteModel(
      description: subtitle.text,
      id: 0,
      isDone: isDone,
      deadlineTime: _selectedDeadlineTime,
      category: categoryContoller.text,
      isThisStar: isThisStar,
    );

    await datebaseProviderForNote.createNoteForDB(noteModel);
  }
}
