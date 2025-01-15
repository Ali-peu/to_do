import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/domain/model/note.dart';

class NotesScreenModelView extends ChangeNotifier {
  final NoteRepository noteRepository;
  final DriftDatebaseProviderForSubNote driftDatebaseProviderForSubNote;

  bool isLoading = true;


  List<NoteModel>? listNoteModel = [];
  NotesScreenModelView(
      {required this.noteRepository,
      required this.driftDatebaseProviderForSubNote}){
        getNotes();
      }

  Future<List<NoteModel>?> getNotes() async {
    final data = await noteRepository.readAllNoteFromDB();
    listNoteModel = data;
    isLoading = false;
    notifyListeners();
    return data;
  }
}
