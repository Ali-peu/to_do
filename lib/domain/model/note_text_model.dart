class NoteTextModel {
  final int id;
  final String text;
  final int noteId;
  final double positionX;
  final double positionY;
  final int textStyle; // 1=курсив, 2=жирный, 3=перечеркнутый
  final int colorID;

  NoteTextModel({
    required this.id,
    required this.text,
    required this.noteId,
    required this.positionX,
    required this.positionY,
    required this.textStyle,
    required this.colorID,
  });

  // Пример методов для преобразования в/из JSON:
  factory NoteTextModel.fromJson(Map<String, dynamic> json) {
    return NoteTextModel(
      id: json['id'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      noteId: json['noteId'] as int? ?? 0,
      positionX: json['positionX'] as double? ?? 0,
      positionY: json['positionY'] as double? ?? 0,
      textStyle: json['textStyle'] as int? ?? 0,
      colorID: json['colorID'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'noteId': noteId,
      'positionX': positionX,
      'positionY': positionY,
      'textStyle': textStyle,
      'colorID': colorID,
    };
  }
}
