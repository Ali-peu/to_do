part of 'note_screen_bloc.dart';

@immutable
sealed class NoteScreenEvent {
  const NoteScreenEvent();
}

final class DrawLines extends NoteScreenEvent {}

final class AddImages extends NoteScreenEvent {}

final class AddTextField extends NoteScreenEvent {
  final double localPositionDx;
  final double localPositionDy;

  final double currentScrollOffset;

  const AddTextField(
      {required this.localPositionDx,
      required this.localPositionDy,
      required this.currentScrollOffset});
}

final class UpdateTextPosition extends NoteScreenEvent {
  final Offset position;
  final int updatedId;
  final double currentScrollOffset;

  const UpdateTextPosition(
      {required this.position,
      required this.updatedId,
      required this.currentScrollOffset});
}

final class IncreaseTextSize extends NoteScreenEvent {}

final class DecreaseTextSize extends NoteScreenEvent {}

final class SaveTextFieldValue extends NoteScreenEvent {
  final String? value;
  final int index;
  const SaveTextFieldValue({required this.value, required this.index});
}

final class SetCurrentTextFieldIndex extends NoteScreenEvent {
  final int index;

  const SetCurrentTextFieldIndex({required this.index});
}

final class FetchData extends NoteScreenEvent {
  final int? noteId;

  const FetchData({required this.noteId});
}

final class SaveNote extends NoteScreenEvent {
  final List<DrawingPoints?> drawingPoints;

  const SaveNote({required this.drawingPoints});
}

final class NoteFavourite extends NoteScreenEvent {}
