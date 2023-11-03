import 'package:hive/hive.dart';
import 'package:to_do/model/category_note.dart';

class HiveCategoryDataBase {
  void initBoxCategory() {
    final box = Hive.box<CategoryNote>('boxCategory');
    box.put(0, CategoryNote(category: "Добавить категорию", id: 0));
    box.put(1, CategoryNote(category: "All", id: 1));
    box.put(2, CategoryNote(category: "Work", id: 2));
    box.put(3, CategoryNote(category: "Study", id: 3));
  }

  void saveCategoryNote(CategoryNote category) {
    final box = Hive.box<CategoryNote>('boxCategory');
    box.put(category.id, category);
  }

  void deleteCategoryNote(CategoryNote category) async {
    final box = Hive.box<CategoryNote>('box');
    box.delete(category.id);
  }
}
