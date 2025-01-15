part of 'note_screen_bloc.dart';

@immutable
sealed class NoteScreenEvent {
  const NoteScreenEvent();
}

final class DrawLines extends NoteScreenEvent {}

final class AddImages extends NoteScreenEvent {}

final class SetCurrentTextFieldIndex extends NoteScreenEvent{
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
