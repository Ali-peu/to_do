import 'package:hive/hive.dart';
import 'package:to_do/model/category_note.dart';

class HiveCategoryDataBase {
  Future<void> initBoxCategory() async {
    final box = Hive.box<CategoryNote>('boxCategory');
    box.put(0, CategoryNote(category: "Добавить категорию", id: 0));
    box.put(1, CategoryNote(category: "All", id: 1));
    box.put(2, CategoryNote(category: "Work", id: 2));
    box.put(3, CategoryNote(category: "Study", id: 3));
  }

  Future<void> saveCategoryNote(CategoryNote category) async {
    print('${category.category} + ${category.id}');

    final box = Hive.box<CategoryNote>('boxCategory');
    box.put(category.id, category);
    print('${category.category} + ${category.id}');
  }

  Future<void> deleteCategoryNote(CategoryNote category) async {
    final box = Hive.box<CategoryNote>('boxCategory');
    box.delete(category.id);
  }
}
