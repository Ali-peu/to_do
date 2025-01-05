part of 'note_screen_bloc.dart';

enum NoteScreenStatus { initial, loading, failure, drawing, success }

class NoteScreenState extends Equatable {
  final NoteScreenStatus noteScreenStatus;
  final bool isFavourite;

  const NoteScreenState(
      {this.isFavourite = false,
      this.noteScreenStatus = NoteScreenStatus.initial,
      });

  NoteScreenState copyWith({
    NoteScreenStatus? noteScreenStatus,
    bool? isFavourite,
  }) {
    return NoteScreenState(
        noteScreenStatus: noteScreenStatus ?? this.noteScreenStatus,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [noteScreenStatus, isFavourite];
}
