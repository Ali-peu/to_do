import 'package:to_do/data/drift/const_drift_instanse.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/linear_model.dart';

class NoteLinearDriftTable extends AppDatabase {
  Future<int?> saveLinearModel(LinearModel linearModel) async {
    final id = await database
        .into(noteLinear)
        .insert(LinearModel.toCompanion(linearModel));

    return id;
  }

  Future<List<LinearModel>> getSaveNoteTexts(int noteId) async {
    final list = await (select(noteLinear)
          ..where((tbl) => tbl.noteId.equals(noteId)))
        .get();

    return list.map(LinearModel.fromComponion).toList();
  }
}
