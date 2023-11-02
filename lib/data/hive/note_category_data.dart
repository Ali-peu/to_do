import 'package:hive/hive.dart';
import 'package:to_do/model/note.dart';

class HiveCategoryDataBase {
  void initBoxCategory() async {
    final box = await Hive.openBox('boxCategory');
    box.add('All');
    box.add('Study');
    box.add('Work');
  }

  void saveCategoryNote(String category) async {
    final box = await Hive.openBox('boxCategory');
    box.add(category);
  }

  void deleteCategoryNote(String category) async {
    final box = await Hive.openBox<Note>('box');
    box.delete(category);
  }
}
