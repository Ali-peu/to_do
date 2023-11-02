import 'package:hive/hive.dart';
import 'package:to_do/model/category_note.dart';

class CategoryAdapter extends TypeAdapter<CategoryNote> {
  @override
  final typeId = 1; // Unique identifier for the type

  @override
  CategoryNote read(BinaryReader reader) {
    return CategoryNote(
      category: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryNote obj) {
    // Convert to milliseconds
    writer.writeString(obj.category);
  }
}
