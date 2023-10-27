import 'package:flutter/material.dart';
import 'package:to_do/model/note.dart';

_showdatepicker(BuildContext context,Note note) {
    showDatePicker(
        context: context,
        initialDate: note.time,
        firstDate: DateTime(2010, 1, 1),
        lastDate: DateTime(2050, 1, 1)).then((value) {

          
        });

  }