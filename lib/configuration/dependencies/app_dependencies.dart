import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do/data/drift/drift_tables/note_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/sub_note_drift_table.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/future/note_screens/notes_screen/tasks_screen_model_view.dart';

final List<SingleChildWidget> appDependencies = [
  Provider(
      create: (context) =>
          NoteRepository(noteDriftProvider: NoteDriftTable())),
  Provider(
      create: (context) => DriftDatebaseProviderForSubNote(
          subNoteDriftProvider: SubNoteDriftProvider())),
  ChangeNotifierProvider(
      lazy: false,
      create: (context) => TasksScreenModelView(
          datebaseProviderForNote: NoteRepository(
              noteDriftProvider: NoteDriftTable()),
          driftDatebaseProviderForSubNote: DriftDatebaseProviderForSubNote(
              subNoteDriftProvider: SubNoteDriftProvider()))),
];
