import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class HiveDatoSource {
  final _myBox = Hive.box('to_do_box');
  final uuid = Uuid().v4();
  List toDoList = [];

  void createInitialDate() {
    toDoList = [
      [
        'Add your Task',
        uuid,
        false,
        DateUtils.dateOnly(DateTime.now()),
        'No category'
      ],
    ];
  }
}
