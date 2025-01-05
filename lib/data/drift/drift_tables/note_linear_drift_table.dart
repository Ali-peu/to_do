
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/linear_model.dart';

class NoteLinearDriftTable  {

  final AppDatabase appDatabase;

  NoteLinearDriftTable({required this.appDatabase});

  Future<int?> saveLinearModel(LinearModel linearModel) async {
    final id = await appDatabase
        .into(appDatabase.noteLinear)
        .insert(LinearModel.toCompanion(linearModel));

    return id;
  }

  Future<List<LinearModel>> getLinearModels(int noteId) async {
    final list = await (appDatabase.select(appDatabase.noteLinear)
          ..where((tbl) => tbl.noteId.equals(noteId)))
        .get();

    return list.map(LinearModel.fromComponion).toList();
  }
}
