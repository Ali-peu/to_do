import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/data/drift/drift_tables/note_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/note_linear_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/note_text_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/position_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/sub_note_drift_table.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/data/drift_datebase_providers/note_linear_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';
import 'package:to_do/future/draw_screen/bloc/draw_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';
import 'package:to_do/future/note_screens/notes_screen/notes_screen_model_view.dart';

final database = AppDatabase();

final List<SingleChildWidget> appDependencies = [
  ChangeNotifierProvider(create: (context) => AddNoteTextFieldNotifier()),
  Provider(
      create: (context) => NoteTextRepository(
          noteTextDriftTable: NoteTextDriftTable(appDatabase: database))),
  Provider(
      create: (context) => NotePositionsRepository(
          positionDriftTable: PositionDriftTable(appDatabase: database))),
  Provider(
      create: (context) => NoteLinearRepository(
          noteLinearDriftTable: NoteLinearDriftTable(appDatabase: database))),
  Provider(
      create: (context) => NoteRepository(
          noteDriftProvider: NoteDriftTable(appDatabase: database))),
  Provider(
      create: (context) => DriftDatebaseProviderForSubNote(
          subNoteDriftProvider: SubNoteDriftProvider(appDatabase: database))),
  ChangeNotifierProvider(
      lazy: false,
      create: (context) => NotesScreenModelView(
          noteRepository: NoteRepository(
              noteDriftProvider: NoteDriftTable(appDatabase: database)),
          driftDatebaseProviderForSubNote: DriftDatebaseProviderForSubNote(
              subNoteDriftProvider:
                  SubNoteDriftProvider(appDatabase: database)))),
  ChangeNotifierProvider(create: (context) => DrawNoteNotifier()),
  BlocProvider(create: (context) => DrawBloc())
];
