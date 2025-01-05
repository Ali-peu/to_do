part of 'note_screen_bloc.dart';

@immutable
sealed class NoteScreenEvent {
  const  NoteScreenEvent();
}

final class DrawLines extends NoteScreenEvent {}

final class AddImages extends NoteScreenEvent {}

final class FetchData extends NoteScreenEvent {
  final int? noteId;

  const FetchData({required this.noteId});
}

final class SaveNote extends NoteScreenEvent {}

final class NoteFavourite extends NoteScreenEvent {}


final class ChangeDrawColor extends NoteScreenEvent{
  final Color color;

  const ChangeDrawColor({required this.color});
}
