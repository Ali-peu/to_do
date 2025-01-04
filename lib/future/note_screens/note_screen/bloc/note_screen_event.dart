part of 'note_screen_bloc.dart';

@immutable
sealed class AddNoteEvent {}

final class DrawLines extends AddNoteEvent {}

final class AddImages extends AddNoteEvent {}

final class FetchData extends AddNoteEvent {
  final int noteId;

  FetchData({required this.noteId});
}
