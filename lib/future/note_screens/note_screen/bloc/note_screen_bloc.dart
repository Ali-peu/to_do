import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do/future/custom_painter/drawing_points_model.dart';
import 'package:to_do/future/note_screens/note_screen/data/save_note_repo.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';
import 'package:to_do/future/note_screens/notes_screen/notes_screen_model_view.dart';

part 'note_screen_event.dart';
part 'note_screen_state.dart';

class NoteScreenBloc extends Bloc<NoteScreenEvent, NoteScreenState> {
  final AddNoteTextFieldNotifier _addNoteTextFieldNotifier;
  final DrawNoteNotifier _drawNoteNotifier;
  final SaveNoteRepo _saveNoteRepo;
  final NotesScreenModelView _notesScreenModelView;

  final int? noteId;
  NoteScreenBloc(
      {required SaveNoteRepo saveNoteRepo,
      required this.noteId,
      required DrawNoteNotifier drawNoteNotifier,
      required AddNoteTextFieldNotifier addNoteTextFieldNotifier,
      required NotesScreenModelView notesScreenModelView})
      : _saveNoteRepo = saveNoteRepo,
        _addNoteTextFieldNotifier = addNoteTextFieldNotifier,
        _drawNoteNotifier = drawNoteNotifier,
        _notesScreenModelView = notesScreenModelView,
        super(const NoteScreenState()) {
    on<DrawLines>((event, emit) {
      if (state.noteScreenStatus == NoteScreenStatus.drawing) {
        emit(state.copyWith(noteScreenStatus: NoteScreenStatus.initial));
      } else {
        emit(state.copyWith(noteScreenStatus: NoteScreenStatus.drawing));
      }
    });

    on<AddTextField>((event, emit) async {
      await _addNoteTextFieldNotifier.onTapUp(
          localPositionDx: event.localPositionDx,
          localPositionDy: event.localPositionDy,
          currentScrollOffset: event.currentScrollOffset);

      final list = _addNoteTextFieldNotifier.noteTextFieldModel;

      emit(state.copyWith(
          noteTextFieldModel: list,
          isFavourite: !state.isFavourite)); // TODO state не видит изменение
      // в листе поэтому меняю булевое значение тоже
    });

    on<UpdateTextPosition>((event, emit) async {
      _addNoteTextFieldNotifier.updateTextPosition(event.position,
          updatedId: event.updatedId,
          currentScrollOffset: event.currentScrollOffset);
      final list = _addNoteTextFieldNotifier.noteTextFieldModel;
      emit(state.copyWith(
          noteTextFieldModel: list, isFavourite: !state.isFavourite));
    });

    on<SaveTextFieldValue>((event, emit) {
      _addNoteTextFieldNotifier.addTextFieldValue(
          value: event.value, index: event.index);
    });

    on<IncreaseTextSize>((event, emit) {
      if (state.currentTextFieldIndex < 0 ||
          state.currentTextFieldIndex >=
              _addNoteTextFieldNotifier.noteTextFieldModel.length) {
        throw IndexError.withLength(state.currentTextFieldIndex,
            _addNoteTextFieldNotifier.noteTextFieldModel.length);
      }

      final currentModel = _addNoteTextFieldNotifier
          .noteTextFieldModel[state.currentTextFieldIndex];
      final currentFontSize = currentModel.textStyle.fontSize ?? 15;

      final list = _addNoteTextFieldNotifier.noteTextFieldModel;
      list[state.currentTextFieldIndex] = currentModel.copyWith(
        textStyle: currentModel.textStyle.copyWith(
          fontSize: currentFontSize + 1,
        ),
      );
      emit(state.copyWith(
          noteTextFieldModel: list, isFavourite: !state.isFavourite));
    });
    on<DecreaseTextSize>((event, emit) {
      if (state.currentTextFieldIndex < 0 ||
          state.currentTextFieldIndex >=
              _addNoteTextFieldNotifier.noteTextFieldModel.length) {
        throw IndexError.withLength(state.currentTextFieldIndex,
            _addNoteTextFieldNotifier.noteTextFieldModel.length);
      }

      final currentModel = _addNoteTextFieldNotifier
          .noteTextFieldModel[state.currentTextFieldIndex];
      final currentFontSize = currentModel.textStyle.fontSize ?? 15;

      final list = _addNoteTextFieldNotifier.noteTextFieldModel;
      list[state.currentTextFieldIndex] = currentModel.copyWith(
        textStyle: currentModel.textStyle.copyWith(
          fontSize: currentFontSize - 1,
        ),
      );
      emit(state.copyWith(
          noteTextFieldModel: list, isFavourite: !state.isFavourite));
    });

    on<SaveNote>((event, emit) {
      _saveNoteRepo
          .saveNote(
              points: event.drawingPoints,
              textController: _addNoteTextFieldNotifier.noteTextFieldModel,
              isFavourite: state.isFavourite)
          .then((value) {
        _notesScreenModelView.getNotes();
      });
    });
    on<NoteFavourite>((event, emit) {
      emit(state.copyWith(isFavourite: !state.isFavourite));
    });

    on<SetCurrentTextFieldIndex>((event, emit) {
      emit(state.copyWith(currentTextFieldIndex: event.index));
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

        _drawNoteNotifier.setDrawingPointsFromLinearModelList(linear);

        await _addNoteTextFieldNotifier.addTextListForStream(
            textsList.map((e) => e).toList(), textPositionsList);
        emit(state.copyWith(
            noteScreenStatus: NoteScreenStatus.success,
            noteTextFieldModel: _addNoteTextFieldNotifier.noteTextFieldModel));
      }
    });
  }
}
