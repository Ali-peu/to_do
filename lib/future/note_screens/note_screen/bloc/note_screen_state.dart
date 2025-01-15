part of 'note_screen_bloc.dart';

enum NoteScreenStatus { initial, loading, failure, drawing, success }

class NoteScreenState extends Equatable {
  final NoteScreenStatus noteScreenStatus;
  final bool isFavourite;
  final int currentTextFieldIndex;

  const NoteScreenState(
      {this.currentTextFieldIndex = 0,
      this.isFavourite = false,
      this.noteScreenStatus = NoteScreenStatus.initial});

  NoteScreenState copyWith(
      {NoteScreenStatus? noteScreenStatus,
      bool? isFavourite,
      int? currentTextFieldIndex}) {
    return NoteScreenState(
        noteScreenStatus: noteScreenStatus ?? this.noteScreenStatus,
        isFavourite: isFavourite ?? this.isFavourite,
        currentTextFieldIndex:
            currentTextFieldIndex ?? this.currentTextFieldIndex);
  }

  @override
  List<Object?> get props =>
      [noteScreenStatus, isFavourite, currentTextFieldIndex];
}
