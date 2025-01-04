// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:to_do/domain/model/category_note.dart';
// import 'package:to_do/domain/model/sub_note_model.dart';

// import 'package:to_do/future/task_screens/add_task_bottom_sheet/add_task_bottom_sheet_model_view.dart';
// import 'package:to_do/future/widgets/app_text_field.dart';
// import 'package:to_do/future/widgets/star_note_icon.dart';
// import 'package:to_do/future/widgets/timer_frame.dart';

// class AddTaskBottomSheet extends StatefulWidget {
//   const AddTaskBottomSheet({super.key});

//   @override
//   State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
// }

// class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
//   DateTime replayTime = MyCustomCalendar().replayTime == null
//       ? DateTime.now()
//       : MyCustomCalendar().replayTime!;

//   late final AddTaskBottomSheetModelView addTaskBottomSheetModelView;

//   @override
//   void initState() {
//     super.initState();
//     addTaskBottomSheetModelView =
//         Provider.of<AddTaskBottomSheetModelView>(context, listen: false);
//   }

//   Widget createButton() {
//     return ElevatedButton(
//         onPressed: () async {
//           if (addTaskBottomSheetModelView.subtitle.text.isEmpty) {
//             return Navigator.pop(context);
//           } else {
//             await addTaskBottomSheetModelView.createNote();
//           }
//         },
//         style: ElevatedButton.styleFrom(
//             shape: const CircleBorder(),
//             padding: const EdgeInsets.all(20),
//             iconColor: Colors.blue),
//         child: const Icon(Icons.keyboard_double_arrow_up_outlined));
//   }

//   Widget subtiteWidget() {
//     return AppTextField(
//       controller: addTaskBottomSheetModelView.subtitle,
//       hintext: ' Введите здесь новую задачу',
//       borderColor: Colors.blue,
//       isDense: false,
//       borderRadius: 20,
//       maxLines: 3,
//       style: const TextStyle(fontSize: 16),
//       hintTextStyle: const TextStyle(fontSize: 16),
//       contentPadding: const EdgeInsets.only(top: 14, left: 10),
//       suffixIcon: StarNoteIcon(
//           onPressed: () {
//             addTaskBottomSheetModelView.setStarNote();
//           },
//           isNoteStar: addTaskBottomSheetModelView.isThisStar),
//     );
//   }

//   DropdownMenuItem<int> dropdownButtonForCategory(CategoryNote categoryNote) {
//     return DropdownMenuItem<int>(
//       value: categoryNote.id,
//       child: Text(
//         categoryNote.category,
//         style: const TextStyle(decoration: TextDecoration.none),
//       ),
//       onTap: () {
//         setState(() {
//           if (categoryNote.category == 'No category') {}
//         });
//       },
//     );
//   }

//   // Widget testDropMenu() {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: DropdownButton<int>(
//   //         icon: const Visibility(visible: false, child: Text('')),
//   //         onChanged: (value) {
//   //           if (value == 0) {
//   //             showAlertDialog(context, categoryContoller);
//   //           }
//   //           setState(() {
//   //             _dropDownButtonValue = value!;
//   //             firstValueCategory;
//   //           });
//   //         },
//   //         value: _dropDownButtonValue,
//   //         items: []),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AddTaskBottomSheetModelView>(
//         builder: (context, value, child) {
//       return Padding(
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
//                 child: subtiteWidget()),
//             ...List<SubNoteModel>.from(addTaskBottomSheetModelView.subNotesList)
//                 .map((e) => Padding(
//                       padding:
//                           const EdgeInsets.only(left: 10, top: 8, bottom: 8),
//                       child: Row(
//                         children: [
//                           Text(
//                             (addTaskBottomSheetModelView.subNotesList
//                                         .indexOf(e) +
//                                     1)
//                                 .toString(),
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 18),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: AppTextField(
//                                 borderColor: Colors.blue,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 16),
//                                 controller: addTaskBottomSheetModelView
//                                         .subNotesListTextControllers[
//                                     addTaskBottomSheetModelView.subNotesList
//                                         .indexOf(e)]),
//                           ),
//                         ],
//                       ),
//                     )),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () => addTaskBottomSheetModelView.addNewSubNote(),
//                   icon: const Text('Добавить подзадачу'),
//                 ),
//                 if (addTaskBottomSheetModelView.subNotesList.isNotEmpty)
//                   IconButton(
//                       onPressed: () =>
//                           addTaskBottomSheetModelView.clearAllListForSubNotes(),
//                       icon: const Icon(Icons.delete_forever)),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: Row(children: [
//                   // testDropMenu(),
//                   IconButton(
//                       icon: addTaskBottomSheetModelView.selectedDeadlineTime ==
//                               null
//                           ? const Row(
//                               children: [
//                                 Text('Дата'),
//                                 SizedBox(width: 5),
//                                 Icon(Icons.edit_calendar_outlined, size: 20),
//                               ],
//                             )
//                           : Text(
//                               addTaskBottomSheetModelView.getDateTimeDDMMYY()),
//                       onPressed: () =>
//                           addTaskBottomSheetModelView.setNewNoteDate(context))
//                 ])),
//                 createButton(),
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
