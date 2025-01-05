part of 'note_screen_bloc.dart';

@immutable
sealed class NoteScreenEvent {}

final class DrawLines extends NoteScreenEvent {}

final class AddImages extends NoteScreenEvent {}

final class FetchData extends NoteScreenEvent {
  final int? noteId;

  FetchData({required this.noteId});
}

final class SaveNote extends NoteScreenEvent {}

final class NoteFavourite extends NoteScreenEvent {}
