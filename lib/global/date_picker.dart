import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/global/validador_text.dart';

import 'package:to_do/model/note.dart';

class DatePicker extends StatefulWidget {
  Note _note;
  DatePicker(this._note, {super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late String time =
      dateTimeDeleteSeconds(widget._note.time.toDate().toString());

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: widget._note.time.toDate(),
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        FirebaseDatasource()
            .updateDeadline(widget._note.id, Timestamp.fromDate(value!));
        time = dateTimeDeleteSeconds(value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
          height: height * 0.4,
          width: width * 0.4,
          alignment: Alignment.center),
    );
  }
}
