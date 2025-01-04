import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do/data/drift/drift_tables/note_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/note_text_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/position_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/sub_note_drift_table.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_sub_note.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';
import 'package:to_do/future/note_screens/notes_screen/notes_screen_model_view.dart';

final List<SingleChildWidget> appDependencies = [
  
  Provider(create: (context)=>NoteTextRepository(noteTextDriftTable: NoteTextDriftTable())),
  Provider(create: (context)=>NotePositionsRepository(positionDriftTable: PositionDriftTable())),


  Provider(
      create: (context) => NoteRepository(noteDriftProvider: NoteDriftTable())),
  Provider(
      create: (context) => DriftDatebaseProviderForSubNote(
          subNoteDriftProvider: SubNoteDriftProvider())),
  ChangeNotifierProvider(
      lazy: false,
      create: (context) => NotesScreenModelView(
          datebaseProviderForNote:
              NoteRepository(noteDriftProvider: NoteDriftTable()),
          driftDatebaseProviderForSubNote: DriftDatebaseProviderForSubNote(
              subNoteDriftProvider: SubNoteDriftProvider()))),
];

