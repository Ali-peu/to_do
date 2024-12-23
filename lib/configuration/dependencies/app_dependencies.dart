import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/future/task_screens/add_note_screen/add_note_screen_model_view.dart';
import 'package:to_do/future/task_screens/task_screen/task_screen_model_view.dart';

final List<SingleChildWidget> appDependencies = [
  Provider(
      create: (context) =>
          DriftDatebaseProviderForNote(noteDriftProvider: NoteDriftProvider())),
  Provider(
      create: (context) => DriftDatebaseProviderForSubNote(
          subNoteDriftProvider: SubNoteDriftProvider())),
  ChangeNotifierProvider(
      lazy: false,
      create: (context) => TaskScreenModelView(
          datebaseProviderForNote: DriftDatebaseProviderForNote(
              noteDriftProvider: NoteDriftProvider()),
          driftDatebaseProviderForSubNote: DriftDatebaseProviderForSubNote(
              subNoteDriftProvider: SubNoteDriftProvider()))),
  ChangeNotifierProvider(create: (context) => AddNoteScreenModelView())
];
