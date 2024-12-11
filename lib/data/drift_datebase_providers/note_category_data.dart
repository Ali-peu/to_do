// import 'package:to_do/domain/model/category_note.dart';

// class HiveCategoryDataBase {
//   final box = Hive.box<CategoryNote>('boxCategory');
//   Future<void> initBoxCategory() async {
//     box.put(0, CategoryNote(category: "Добавить категорию", id: 0));
//     box.put(1, CategoryNote(category: "All", id: 1));
//     box.put(2, CategoryNote(category: "Work", id: 2));
//     box.put(3, CategoryNote(category: "Study", id: 3));
//   }

//   Future<void> saveCategoryNote(CategoryNote category) async {
//     box.put(category.id, category);
//   }

//   Future<void> deleteCategoryNote(CategoryNote category) async {
//     box.delete(category.id);
//   }
// }
