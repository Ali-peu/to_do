import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/domain/model/note.dart';
import 'package:to_do/future/widgets/timer_frame.dart';

class AddTaskBottomSheetModelView extends ChangeNotifier {
  final subtitle = TextEditingController();
  final categoryContoller = TextEditingController();

  final DriftDatebaseProviderForNote datebaseProviderForNote;

  DateTime? _selectedDeadlineTime;
  DateTime? get selectedDeadlineTime => _selectedDeadlineTime;

  bool isDone = false;
  bool isThisStar = false;

  AddTaskBottomSheetModelView({required this.datebaseProviderForNote});
  int dropDownButtonValue = 1;

  Future<void> setNewNoteDate(BuildContext context) async {
    final data = await MyCustomCalendar().showCustomDatePickerPac(context);

    _selectedDeadlineTime = data;
    notifyListeners();
  }

  void setStarNote() {
    isThisStar = !isThisStar;
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
