import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/data/drift_datebase_providers/note_linear_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';
import 'package:to_do/domain/model/linear_model.dart';
import 'package:to_do/domain/model/note.dart';
import 'package:to_do/domain/model/note_text_model.dart';
import 'package:to_do/domain/model/position_model.dart';

class SaveNoteRepo {
  final NoteTextRepository noteTextRepository;
  final NotePositionsRepository notePositionsRepository;
  final NoteRepository noteRepository;
  final NoteLinearRepository noteLinearRepository;

  SaveNoteRepo({
    required this.noteTextRepository,
    required this.noteRepository,
    required this.notePositionsRepository,
    required this.noteLinearRepository,
  });

  Future<void> saveNote(
      {required List<Offset> textPositions,
      required List<String> texts,
      required bool isFavourite,
      required List<List<Offset>> linearPositions,
      required List<String> linearColors}) async {
    if (textPositions.length != texts.length) {
      throw ArgumentError(
        'Length of textPositions (${textPositions.length}) does not match length of text (${texts.length})',
      );
    }
    try {
      final noteId = await noteRepository.createNoteForDB(
          NoteModel(id: 0, category: 'NO', isFavourite: isFavourite));
      if (noteId != null) {
        for (var i = 0; i < textPositions.length; i++) {
          final id = await noteTextRepository.saveNoteTexts(
              text: texts[i], noteId: noteId);
          if (id != null) {
            await notePositionsRepository.savePosition(
                dx: textPositions[i].dx,
                dy: textPositions[i].dy,
                parentId: id,
                positionType: PositionType.text);
          }
        }

        for (var i = 0; i < linearPositions.length; i++) {
           await noteLinearRepository.saveLinearModel(LinearModel(
            noteId: noteId,
            id: 0,
            strokeWidth: 2,
            colorHex: Colors.blue.toHexString(),
            dxPositions: linearPositions[i].map((e) => e.dx).toList(),
            dyPositions: linearPositions[i].map((e) => e.dy).toList(),
          ));
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<PositionModel>?> getNoteTextPositions(
    List<int> textsId,
  ) async {
    final list = <PositionModel>[];
    for (final element in textsId) {
      final getPosition = await notePositionsRepository.getObjectPosition(
          parentId: element, positionType: PositionType.text);
      list.add(getPosition);
    }
    return list;
  }

  Future<List<NoteTextModel>> getNoteTexts(int noteId) async {
    final list = await noteTextRepository.getNoteTexts(noteId: noteId);
    return list;
  }

  // Future<List<PositionModel>?> getNoteLinearPositions(
  //   List<int> linearsId,
  // ) async {
  //   final list = <PositionModel>[];
  //   for (final element in linearsId) {
  //     final getPosition = await notePositionsRepository.getObjectPosition(
  //         parentId: element, positionType: PositionType.linear);
  //     list.add(getPosition);
  //   }
  //   return list;
  // }

  Future<List<LinearModel>> getNoteLinear(int noteId) async {
    final list = await noteLinearRepository.getLinearModel(noteId);
    return list;
  }
}
