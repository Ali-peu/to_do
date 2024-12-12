import 'package:flutter/material.dart';
import 'package:to_do/domain/model/category_note.dart';

import 'package:to_do/future/task_screens/add_task_bottom_sheet/add_task_bottom_sheet_model_view.dart';
import 'package:to_do/future/widgets/timer_frame.dart';
import 'package:to_do/future/widgets/universal_text_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final AddTaskBottomSheetModelView addTaskBottomSheetModelView;
  const AddTaskBottomSheet(
      {super.key, required this.addTaskBottomSheetModelView});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime replayTime = MyCustomCalendar().replayTime == null
      ? DateTime.now()
      : MyCustomCalendar().replayTime!;

  Widget createButton() {
    return ElevatedButton(
        onPressed: () async {
          if (widget.addTaskBottomSheetModelView.subtitle.text.isEmpty) {
            return Navigator.pop(context);
          } else {
            widget.addTaskBottomSheetModelView.createNote();
          }
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            iconColor: Colors.blue),
        child: const Icon(
          Icons.keyboard_double_arrow_up_outlined
        ));
  }

  Widget subtiteWidget() {
    return TextField(
      maxLines: 1,
      autofocus: true,
      controller: widget.addTaskBottomSheetModelView.subtitle,
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
          if (categoryNote.category == 'No category') {
            // firstValueCategory.category = 'All';
          }
          // firstValueCategory = categoryNote;
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
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: subtiteWidget(),
                  ))),
          Row(
            children: [
              Expanded(
                  child: Row(children: [
                // testDropMenu(),
                IconButton(
                  icon: const Icon(Icons.edit_calendar_outlined),
                  onPressed: () async {
                    final data  = await MyCustomCalendar()
                            .showCustomDatePickerPac(context);

                    widget.addTaskBottomSheetModelView.setNewNoteDate(data);
                  },
                ),
              ])),
              createButton(),
            ],
          )
        ],
      ),
    );
  }
}
