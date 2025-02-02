// import 'package:flutter/material.dart';
// import 'package:to_do/configuration/validators/date_time_validators.dart';
// import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
// import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
// import 'package:to_do/domain/model/note.dart';
// import 'package:to_do/domain/model/sub_note_model.dart';
// import 'package:to_do/future/widgets/timer_frame.dart';

// class AddTaskBottomSheetModelView extends ChangeNotifier {
//   final subtitle = TextEditingController();
//   final categoryContoller = TextEditingController();

//   final DriftDatebaseProviderForNote datebaseProviderForNote;
//   final DriftDatebaseProviderForSubNote datebaseProviderForSubNote;

//   DateTime? _selectedDeadlineTime;
//   DateTime? get selectedDeadlineTime => _selectedDeadlineTime;

//   List<SubNoteModel> subNotesList = [];
//   List<TextEditingController> subNotesListTextControllers = [];

//   bool isDone = false;
//   bool isThisStar = false;

//   AddTaskBottomSheetModelView(
//       {required this.datebaseProviderForSubNote,
//       required this.datebaseProviderForNote});
//   int dropDownButtonValue = 1;

//   String getDateTimeDDMMYY() {
//     return DateTimeValidators.getDateTimeyMMMd(_selectedDeadlineTime);
//   }

//   Future<void> addNewSubNote() async {
//     if (subNotesList.isNotEmpty) {
//       // ignore: prefer_foreach
//       for (final element in subNotesList) {
//         setNewValueForSubNoteTask(element);
//       }
//     }
//     if (subNotesList.isNotEmpty && subNotesList.last.description.isEmpty) {
//       return;
//     }
//     subNotesList.add(SubNoteModel.empty());
//     subNotesListTextControllers.add(TextEditingController());
//     notifyListeners();
//   }

//   Future<void> clearAllListForSubNotes() async {
//     subNotesList.clear();
//     subNotesListTextControllers.clear();
//     notifyListeners();
//   }

//   void setNewValueForSubNoteTask(SubNoteModel e) {
//     final index = subNotesList.indexOf(e);
//     final data = subNotesList[index];
//     final value = subNotesListTextControllers[index].text;
//     final newData = data.copyWith(description: value);
//     subNotesList[index] = newData;
//     notifyListeners();
//   }

//   Future<void> setNewNoteDate(BuildContext context) async {
//     final data = await MyCustomCalendar().showCustomDatePickerPac(context);

//     _selectedDeadlineTime = data;
//     notifyListeners();
//   }

//   // Future<void>

//   void setStarNote() {
//     isThisStar = !isThisStar;
//     notifyListeners();
//   }

//   Future<void> createNote() async {
//     final parentID = await createNoteModel();
//     if (parentID != null) {
//       for (final element in subNotesList) {
//         final index = subNotesList.indexOf(element);
//         await createSubNoteModel(parentID,
//             description: subNotesListTextControllers[index].text,
//             importanceValue: index);
//       }
//     }
//   }

//   Future<int?> createNoteModel() async {
//     final noteModel = NoteModel(
//       description: subtitle.text,
//       id: 0,
//       isDone: isDone,
//       deadlineTime: _selectedDeadlineTime,
//       category: categoryContoller.text,
//       isThisStar: isThisStar,
//     );

//     final id = await datebaseProviderForNote.createNoteForDB(noteModel);
//     return id;
//   }

//   Future<void> createSubNoteModel(int parentID,
//       {required String description, int? importanceValue}) async {
//     final subNoteModel = SubNoteModel(
//       description: description,
//       id: 0,
//       parentId: parentID,
//       importanceValue: importanceValue,
//     );

//     await datebaseProviderForSubNote.createNoteForDB(subNoteModel);
//   }
// }
