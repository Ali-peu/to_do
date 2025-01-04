import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/position_model.dart';

class PositionDriftTable extends AppDatabase {
  // Сохранение позиции
  Future<int> savePosition({
    required double dx,
    required double dy,
    required int parentId,
    required PositionType positionType,
  }) async {
    final model = PositionModel(
      dx: dx,
      dy: dy,
      id: 0, // id не используется при вставке, так как генерируется базой данных
      parentId: parentId,
      positionType: positionType,
    );

    // Конвертация модели в Companion
    final id = await into(positions).insert(PositionModel.toCompanion(model));
    return id;
  }

  // Получение списка позиций
  Future<PositionModel> getPositions({
    required PositionType positionType,
    required int parentId,
  }) async {
    final query = select(positions)
      ..where((tbl) {
        return Expression.and([
          tbl.parentId.equals(parentId),
          tbl.positionType.equals(positionType.name)
        ]);
      });

    final model = await query.getSingle();

    return PositionModel.fromCompanion(model);
  }
}
