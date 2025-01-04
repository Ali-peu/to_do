import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';

part 'note_screen_event.dart';
part 'note_screen_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final DrawNoteNotifier drawNoteNotifier;
  final AddNoteTextFieldNotifier addNoteTextFieldNotifier;
  AddNoteBloc(
      {required this.drawNoteNotifier, required this.addNoteTextFieldNotifier})
      : super(AddNoteInitial()) {
    on<DrawLines>((event, emit) {
      if (state is AddNoteDrawLinesState) {
        emit(AddNoteInitial());
      } else {
        emit(AddNoteDrawLinesState());
      }
    });
  }
}
