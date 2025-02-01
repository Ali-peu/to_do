part of 'note_screen_bloc.dart';

enum NoteScreenStatus { initial, loading, failure, drawing, success }

class NoteScreenState extends Equatable {
  final NoteScreenStatus noteScreenStatus;
  final bool isFavourite;
  final int currentTextFieldIndex;
  final List<NoteTextFieldModel> noteTextFieldModel;

  const NoteScreenState(
      {this.currentTextFieldIndex = 0,
      this.isFavourite = false,
      this.noteScreenStatus = NoteScreenStatus.initial,
      this.noteTextFieldModel = const []});

  NoteScreenState copyWith(
      {NoteScreenStatus? noteScreenStatus,
      bool? isFavourite,
      int? currentTextFieldIndex,
      List<NoteTextFieldModel>? noteTextFieldModel}) {
    return NoteScreenState(
        noteScreenStatus: noteScreenStatus ?? this.noteScreenStatus,
        isFavourite: isFavourite ?? this.isFavourite,
        currentTextFieldIndex:
            currentTextFieldIndex ?? this.currentTextFieldIndex,
        noteTextFieldModel: noteTextFieldModel ?? this.noteTextFieldModel);
  }

  @override
  List<Object?> get props => [
        noteScreenStatus,
        isFavourite,
        currentTextFieldIndex,
        noteTextFieldModel
      ];
}
