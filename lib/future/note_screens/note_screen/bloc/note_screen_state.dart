part of 'note_screen_bloc.dart';

@immutable
sealed class AddNoteState {}




final class AddNoteInitial extends AddNoteState {

}

final class AddNoteWorkWithImagesState extends AddNoteState{

}

final class AddNoteDrawLinesState extends AddNoteState{

} 
