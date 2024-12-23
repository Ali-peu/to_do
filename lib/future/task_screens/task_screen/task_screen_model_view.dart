import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/domain/model/note.dart';

class TaskScreenModelView extends ChangeNotifier {
  final DriftDatebaseProviderForNote datebaseProviderForNote;
  final DriftDatebaseProviderForSubNote driftDatebaseProviderForSubNote;

  bool isLoading = true;


  List<NoteModel>? listNoteModel = [];
  TaskScreenModelView(
      {required this.datebaseProviderForNote,
      required this.driftDatebaseProviderForSubNote}){
        getNotes();
      }

  Future<List<NoteModel>?> getNotes() async {
    final data = await datebaseProviderForNote.readAllNoteFromDB();
    listNoteModel = data;
    isLoading = false;
    notifyListeners();
    return data;
  }
}
