import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';
import 'package:to_do/domain/model/note.dart';
import 'package:to_do/domain/model/note_text_model.dart';
import 'package:to_do/domain/model/position_model.dart';

class SaveNoteRepo {
  final NoteTextRepository noteTextRepository;
  final NotePositionsRepository notePositionsRepository;
  final NoteRepository noteRepository;

  SaveNoteRepo(
      {required this.noteTextRepository,
      required this.noteRepository,
      required this.notePositionsRepository});

  Future<void> saveNote(
      {required List<Offset> textPositions,
      required List<String> text,
      required bool isFavourite
      // required List<List<Offset>> linearPositions,
      // required List<String> linearColors
      }) async {
    if (textPositions.length != text.length) {
      throw ArgumentError(
        'Length of textPositions (${textPositions.length}) does not match length of text (${text.length})',
      );
    }
    try {
      final noteId = await noteRepository.createNoteForDB(
          NoteModel(id: 0, category: 'NO', isFavourite: isFavourite));
      if (noteId != null) {
        for (var i = 0; i < textPositions.length; i++) {
          final id = await noteTextRepository.saveNoteTexts(
              text: text[i], noteId: noteId);
          if (id != null) {
            await notePositionsRepository.savePosition(
                dx: textPositions[i].dx,
                dy: textPositions[i].dy,
                parentId: id,
                positionType: PositionType.text);
          }
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
}
