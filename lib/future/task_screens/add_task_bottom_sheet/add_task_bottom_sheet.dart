import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/domain/model/category_note.dart';
import 'package:to_do/domain/model/sub_note_model.dart';

import 'package:to_do/future/task_screens/add_task_bottom_sheet/add_task_bottom_sheet_model_view.dart';
import 'package:to_do/future/widgets/app_text_field.dart';
import 'package:to_do/future/widgets/star_note_icon.dart';
import 'package:to_do/future/widgets/timer_frame.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime replayTime = MyCustomCalendar().replayTime == null
      ? DateTime.now()
      : MyCustomCalendar().replayTime!;

  late final AddTaskBottomSheetModelView addTaskBottomSheetModelView;

  @override
  void initState() {
    super.initState();
    addTaskBottomSheetModelView =
        Provider.of<AddTaskBottomSheetModelView>(context, listen: false);
  }

  Widget createButton() {
    return ElevatedButton(
        onPressed: () async {
          if (addTaskBottomSheetModelView.subtitle.text.isEmpty) {
            return Navigator.pop(context);
          } else {
            await addTaskBottomSheetModelView.createNote();
          }
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            iconColor: Colors.blue),
        child: const Icon(Icons.keyboard_double_arrow_up_outlined));
  }

  Widget subtiteWidget() {
    return TextField(
      autofocus: true,
      controller: addTaskBottomSheetModelView.subtitle,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: 'Введите здесь новую задачу',
        border: InputBorder.none,
      ),
    );
  }

  DropdownMenuItem<int> dropdownButtonForCategory(CategoryNote categoryNote) {
    return DropdownMenuItem<int>(
      value: categoryNote.id,
      child: Text(
        categoryNote.category,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
      onTap: () {
        setState(() {
          if (categoryNote.category == 'No category') {}
        });
      },
    );
  }

  // Widget testDropMenu() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: DropdownButton<int>(
  //         icon: const Visibility(visible: false, child: Text('')),
  //         onChanged: (value) {
  //           if (value == 0) {
  //             showAlertDialog(context, categoryContoller);
  //           }
  //           setState(() {
  //             _dropDownButtonValue = value!;
  //             firstValueCategory;
  //           });
  //         },
  //         value: _dropDownButtonValue,
  //         items: []),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTaskBottomSheetModelView>(
        builder: (context, value, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Flexible(child: subtiteWidget()),
                      StarNoteIcon(
                          onPressed: () {
                            addTaskBottomSheetModelView.setStarNote();
                          },
                          isNoteStar: addTaskBottomSheetModelView.isThisStar)
                    ],
                  ),
                )),
            ...List<SubNoteModel>.from(addTaskBottomSheetModelView.subNotesList)
                .map((e) => AppTextField(
                    controller: addTaskBottomSheetModelView
                            .subNotesListTextControllers[
                        addTaskBottomSheetModelView.subNotesList.indexOf(e)])),
            Row(
              children: [
                IconButton(
                    onPressed: () =>
                        addTaskBottomSheetModelView.addNewSubNote(),
                    icon: const Icon(Icons.add)),
                if (addTaskBottomSheetModelView.subNotesList.isNotEmpty)
                  IconButton(
                      onPressed: () =>
                          addTaskBottomSheetModelView.clearAllListForSubNotes(),
                      icon: const Icon(Icons.delete_forever)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Row(children: [
                  // testDropMenu(),

                  IconButton(
                      icon: addTaskBottomSheetModelView.selectedDeadlineTime ==
                              null
                          ? const Icon(Icons.edit_calendar_outlined)
                          : Text(addTaskBottomSheetModelView
                              .selectedDeadlineTime
                              .toString()),
                      onPressed: () =>
                          addTaskBottomSheetModelView.setNewNoteDate(context))
                ])),
                createButton(),
              ],
            )
          ],
        ),
      );
    });
  }
}
