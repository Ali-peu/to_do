import 'package:flutter/material.dart';

String? emailCheck(String? email) {
  if (email == null || email.isEmpty) {
    return "Email can't be empty";
  }
  final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (!emailRegExp.hasMatch(email)) {
    return 'Проверьте ваш эмейл';
  }
  return null;
}

String? passwordCheck(String? password) {
  if (password == null || password.isEmpty) {
    return "Password can't be empty";
  }
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (!passwordRegExp.hasMatch(password)) {
    return 'Пароль не подходить';
  }
  return null;
}

passwordConfirmCheck(String? password, String? passwordConfirm) {
  if (password != passwordConfirm) {
    return 'Passwords don\'t match';
  }
  return null;
}

String showCorrectTextInTaskContainer(String taskText) {
  if (taskText.length <= 10) {
    return taskText;
  } else {
    int startIndex = 0;
    late int indexOfSpace;

    for (int i = 0; i < 6; i++) {
      indexOfSpace = taskText.indexOf(' ', startIndex);
      if (indexOfSpace == -1) {
        //-1 is when character is not found
        return taskText;
      }
      startIndex = indexOfSpace + 1;
    }

    return '${taskText.substring(0, indexOfSpace)}...';
  }
}

String dateTimeDeleteSeconds(String date) {
  int lenght = date.length;
  String onlyData = date.substring(0, lenght - 12);

  return '${onlyData.substring(0, 4)}/${onlyData.substring(5, 7)}/${onlyData.substring(8, 11)}';
}

String deadlineTask(String deadline) {
  return '${deadline.substring(5, 7)}-${deadline.substring(8, 11)}';
}

bool isThatDeadlineAsGone(DateTime dateTime) {
  if (dateTime.compareTo(DateTime.now()) == 0) {
    return true;
  }
  if (dateTime.compareTo(DateTime.now()) == 1) {
    return true;
  }
  return false;
}

String checkDeaadline(DateTime datetime) {
  if (datetime.day == DateTime.now().day &&
      datetime.month == DateTime.now().month &&
      datetime.year == DateTime.now().year) {
    return 'Today Tasks';
  } else if (datetime.isAfter(DateTime.now())) {
    return 'Future Tasks';
  } else {
    return 'Past Tasks';
  }
}

bool boolCheckDeaadline(DateTime dateTime) {
  if (dateTime.day == DateTime.now().day &&
      dateTime.month == DateTime.now().month &&
      dateTime.year == DateTime.now().year) {
    return true;
  }
  return false;
}

bool checkThisIsPastTask(DateTime dateTime) {
  if (DateUtils.dateOnly(dateTime)
          .compareTo(DateUtils.dateOnly(DateTime.now())) ==
      -1) {
    return true;
  }
  return false;
}
