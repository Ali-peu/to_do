import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

enum PositionType { linear, text, image, undefined }

PositionType getPositionTypeFromString(String value) {
  switch (value) {
    case 'linear':
      return PositionType.linear;
    case 'text':
      return PositionType.text;
    case 'image':
      return PositionType.image;
    default:
      return PositionType.undefined;
  }
}

class PositionModel {
  final double dx;
  final double dy;
  final double rotate;
  final double scaleX;
  final double scaleY;
  final double opacity;
  final int id;
  final int parentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PositionType positionType;

  PositionModel({
    required this.dx,
    required this.dy,
    required this.id,
    required this.parentId,
    required this.positionType,
    this.rotate = 0.0,
    this.scaleX = 1.0,
    this.scaleY = 1.0,
    this.opacity = 1.0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  static PositionsCompanion toCompanion(PositionModel model) {
    return PositionsCompanion(
        dx: Value(model.dx),
        dy: Value(model.dy),
        rotate: Value(model.rotate),
        scaleX: Value(model.scaleX),
        scaleY: Value(model.scaleY),
        opacity: Value(model.opacity),
        parentId: Value(model.parentId),
        positionType: Value(model.positionType.name));
  }

  PositionModel.fromCompanion(Position position)
      : dx = position.dx,
        dy = position.dy,
        parentId = position.parentId,
        id = position.id,
        positionType = getPositionTypeFromString(position.positionType ?? ''),
        rotate = position.rotate,
        scaleX = position.scaleX,
        scaleY = position.scaleY,
        opacity = position.opacity,
        createdAt = position.createdAt,
        updatedAt = position.updatedAt;
}
