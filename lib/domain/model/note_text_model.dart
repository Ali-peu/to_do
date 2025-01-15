import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

FontWeight getWeightFromIntValue(int weightValue){
  switch(weightValue){
    case 0: return FontWeight.w100;
    case 1:return FontWeight.w200;
    case 2:return FontWeight.w300;
    case 3:return FontWeight.w400;
    case 4:return FontWeight.w500;
    case 5:return FontWeight.w600;
    case 6:return FontWeight.w700;
    case 7:return FontWeight.w800;
    case 8:return FontWeight.w900;
    case 9:return FontWeight.bold;
    case 10:return FontWeight.normal;
    default : return FontWeight.normal;


  }
}


class NoteTextModel {
  final int id;
  final String text;
  final int noteId;
  final int? weightValue; // avalible 0 - 10 values
  final bool isCursiv;
  final String colorHex;
  final double? textSize;


  NoteTextModel({
    required this.id,
    required this.text,
    required this.noteId,
    required this.weightValue,
    required this.colorHex,
    required this.isCursiv,
    required this.textSize
  });

  

 
  static NoteTextsCompanion toCompanion(NoteTextModel noteTextModel) {
    return NoteTextsCompanion(
        textValue: Value(noteTextModel.text),
        colorHex: Value(noteTextModel.colorHex),
        noteId: Value(noteTextModel.noteId),
        weightValue: Value(noteTextModel.weightValue),
        isCursiv: Value(noteTextModel.isCursiv),
        textSize: Value(noteTextModel.textSize),
        
        );
  }

  NoteTextModel.fromComponion(NoteText noteText)
      : text = noteText.textValue,
        weightValue = noteText.weightValue,
        isCursiv = noteText.isCursiv,
        textSize = noteText.textSize,
        id = noteText.id,
        colorHex = noteText.colorHex,
        noteId = noteText.noteId;
        
        }
