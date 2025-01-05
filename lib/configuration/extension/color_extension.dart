
import 'package:flutter/material.dart';

extension StringToColorExtension on String {
  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Добавляем непрозрачность по умолчанию.
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor', radix: 16)); // Указываем базу 16.
    }
    throw ArgumentError.value('$this is not a valid hex color');
  }
}

extension ColorToStringExtension on MaterialColor {
  String toHexString() {
    final primaryValue = value ;
    return '#${primaryValue.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
