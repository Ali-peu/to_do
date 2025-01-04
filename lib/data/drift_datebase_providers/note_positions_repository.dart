import 'package:to_do/data/drift/drift_tables/position_drift_table.dart';
import 'package:to_do/domain/model/position_model.dart';

class NotePositionsRepository {
  final PositionDriftTable positionDriftTable;

  NotePositionsRepository({required this.positionDriftTable});

  Future<PositionModel> getObjectPosition({
    required int parentId,
    required PositionType positionType,
  }) =>
      positionDriftTable.getPositions(
        parentId: parentId,
        positionType: positionType,
      );

  Future<int> savePosition({
    required double dx,
    required double dy,
    required int parentId,
    required PositionType positionType,
  }) =>
      positionDriftTable.savePosition(
        dx: dx,
        dy: dy,
        parentId: parentId,
        positionType: positionType,
      );
}
