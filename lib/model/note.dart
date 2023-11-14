class Note {
  String description;
  String id;
  DateTime time;
  bool isDone;
  String category;
  bool isThisStar;
  DateTime replayTime1;
  DateTime replayTime2;
  Note({
    required this.description,
    required this.id,
    required this.isDone,
    required this.time,
    required this.category,
    required this.isThisStar,
    required this.replayTime1,
    required this.replayTime2,
  });

  // factory Note.fromJson(Map<String, dynamic> json) { Пока не нужен потому что я никуда данные не отправляю
  //   return Note(
  //     description: json['description'],
  //     id: json['id'],
  //     time: json['time'],
  //     isDone: json['isDone'],
  //     category: json['category'],
  //     isThisStar: json['isThisStar'],
  //     replayTime1: json

  //   );
  // }
}
