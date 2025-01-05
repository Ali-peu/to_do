import 'package:to_do/data/drift/drift_tables/note_linear_drift_table.dart';
import 'package:to_do/domain/model/linear_model.dart';

class NoteLinearRepository {
  final NoteLinearDriftTable noteLinearDriftTable;

  NoteLinearRepository({required this.noteLinearDriftTable});

  Future<int?> saveLinearModel(LinearModel linearModel) async =>
      noteLinearDriftTable.saveLinearModel(linearModel);

  Future<List<LinearModel>> getLinearModel(int noteId) async =>
      noteLinearDriftTable.getLinearModels(noteId);
}
