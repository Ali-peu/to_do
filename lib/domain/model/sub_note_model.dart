class SubNoteModel {
  final int parentID;
  final int id;
  final String description;
  final String? comment;
  final int importanceValue; // max 10 min 0

  SubNoteModel(
      {required this.parentID,
      required this.id,
      required this.description,
      required this.comment,
      int? importanceValue})
      : importanceValue = importanceValue ?? 0;

  
}
