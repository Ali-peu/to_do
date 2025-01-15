import 'dart:developer';

import 'package:flutter/material.dart';

extension StringToColorExtension on String {
  Color toColor() {
    try {
      var hexColor = replaceAll('#', ''); // Убираем #, если он есть.

      if (hexColor.isEmpty) {
        return Colors.black;
      }
      if (hexColor.length == 6) {
        hexColor =
            'FF$hexColor'; // Добавляем непрозрачность по умолчанию, если длина 6.
      }

      if (hexColor.length == 8 || hexColor.length == 10) {
        // Пытаемся парсить строку как шестнадцатеричное значение.
        return Color(int.parse('$hexColor', radix: 16));
      }

      throw ArgumentError.value('$this is not a valid hex color');
    } on Exception catch (e) {
      log(e.toString());
      throw ArgumentError(e.toString());
    }
  }
}

extension MaterialColorToStringExtension on MaterialColor {
  String toHexString() {
    final primaryValue = value;
    return '#${primaryValue.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}

extension ColorToStringExtension on Color {
  String toHexString() {
    try {
      final valueKey = value; // Значение цвета
      final valueToRadix = valueKey.toRadixString(16); // Преобразование в hex
      final valueToRadixWithPadleft =
          valueToRadix.padLeft(8, '0'); // Дополнение нулями

      return '#${valueToRadixWithPadleft.toUpperCase()}'; // Преобразование в верхний регистр
    } on Exception catch (e) {
      debugPrint('Error converting color to hex string: $e');
      return '';
    }
  }
}
