import 'package:hive/hive.dart';
import 'package:to_do/domain/model/category_note.dart';

class CategoryAdapter extends TypeAdapter<CategoryNote> {
  @override
  final typeId = 1; // Unique identifier for the type

  @override
  CategoryNote read(BinaryReader reader) {
    return CategoryNote(
      id: reader.readInt(),
      category: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryNote obj) {
    // Convert to milliseconds
    writer.writeInt(obj.id);
    writer.writeString(obj.category);
  }
}
