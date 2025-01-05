import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do/future/note_screens/note_screen/data/save_note_repo.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';

part 'note_screen_event.dart';
part 'note_screen_state.dart';

class NoteScreenBloc extends Bloc<NoteScreenEvent, NoteScreenState> {
  final DrawNoteNotifier drawNoteNotifier;
  final AddNoteTextFieldNotifier addNoteTextFieldNotifier;

  final SaveNoteRepo _saveNoteRepo;
  final int? noteId;
  NoteScreenBloc(
      {required SaveNoteRepo saveNoteRepo,
      required this.drawNoteNotifier,
      required this.noteId,
      required this.addNoteTextFieldNotifier})
      : _saveNoteRepo = saveNoteRepo,
        super(const NoteScreenState()) {
    on<DrawLines>((event, emit) {
      if (state.noteScreenStatus == NoteScreenStatus.drawing) {
        emit(state.copyWith(noteScreenStatus: NoteScreenStatus.initial));
      } else {
        emit(state.copyWith(noteScreenStatus: NoteScreenStatus.drawing));
      }
    });
    on<SaveNote>((event, emit) {
      _saveNoteRepo.saveNote(
          linearPositions: drawNoteNotifier.points,
          paints: drawNoteNotifier.paints,
          textPositions: addNoteTextFieldNotifier.positions,
          texts:
              addNoteTextFieldNotifier.controllers.map((e) => e.text).toList(),
          isFavourite: state.isFavourite);
    });
    on<NoteFavourite>((event, emit) {
      emit(state.copyWith(isFavourite: !state.isFavourite));
    });
    on<ChangeDrawColor>((event, emit) async {
      drawNoteNotifier.color = event.color;
    });

    on<FetchData>((event, emit) async {
      if (event.noteId != null) {
        final textsList = await saveNoteRepo.getNoteTexts(event.noteId!);

        final textPositionsList = await saveNoteRepo
                .getNoteTextPositions(textsList.map((e) => e.id).toList()) ??
            [];

        if (textsList.length != textPositionsList.length) {
          throw ArgumentError(
            'Length of textPositions (${textPositionsList.length}) does not match length of text (${textsList.length})',
          );
        }

        final linear = await saveNoteRepo.getNoteLinear(event.noteId!);

        await drawNoteNotifier
            .addValueForStream(linear.map((e) => e.toOffset()).toList());
        await drawNoteNotifier.createPaints(linear);

        await addNoteTextFieldNotifier
            .addTextListForStream(textsList.map((e) => e.description).toList());
        await addNoteTextFieldNotifier.addTextPositions(
            textPositionsList.map((e) => Offset(e.dx, e.dy)).toList());
        emit(state.copyWith(noteScreenStatus: NoteScreenStatus.success));
      }
    });
  }
}
