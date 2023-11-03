class Note {
  String description;
  String id;
  DateTime time;
  bool isDone;
  String category;
  bool isThisStar;
  String replayTime;

  Note({
    required this.description,
    required this.id,
    required this.isDone,
    required this.time,
    required this.category,
    required this.isThisStar,
    required this.replayTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      description: json['description'],
      id: json['id'],
      time: json['time'],
      isDone: json['isDone'],
      category: json['category'],
      isThisStar: json['isThisStar'],
      replayTime: json['replayTime'],
    );
  }
}
