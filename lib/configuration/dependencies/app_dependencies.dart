import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';
import 'package:to_do/global/theme.dart';

final List<SingleChildWidget> appDependencies = [
  Provider(
      create: (context) =>
          DriftDatebaseProviderForNote(noteDriftProvider: NoteDriftProvider())),
];
