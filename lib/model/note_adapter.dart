import 'package:hive/hive.dart';
import 'note.dart';

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final typeId = 0; // Unique identifier for the type

  @override
  Note read(BinaryReader reader) {
    return Note(
        description: reader.readString(),
        id: reader.readString(),
        isDone: reader.readBool(),
        time: DateTime.fromMillisecondsSinceEpoch(
            reader.readInt()), // Convert to DateTime
        category: reader.readString(),
        isThisStar: reader.readBool(),
        replayTime1: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
        replayTime2: DateTime.fromMillisecondsSinceEpoch(reader.readInt()));
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.writeString(obj.description);
    writer.writeString(obj.id);
    writer.writeBool(obj.isDone);
    writer.writeInt(obj.time.millisecondsSinceEpoch); // Convert to milliseconds
    writer.writeString(obj.category);
    writer.writeBool(obj.isThisStar);
    writer.writeInt(obj.replayTime1.millisecondsSinceEpoch);
    writer.writeInt(obj.replayTime2.millisecondsSinceEpoch);
  }
}
