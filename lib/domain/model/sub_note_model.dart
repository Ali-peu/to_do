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

  SubNoteModel.empty()
      : parentID = 0,
        id = 0,
        description = '',
        comment = '',
        importanceValue = 0;

  SubNoteModel copyWith(
      {int? parentID,
      int? id,
      String? comment,
      String? description,
      int? importanceValue}) {
    return SubNoteModel(
        parentID: parentID ?? this.parentID,
        id: id ?? this.id,
        description: description ?? this.description,
        comment: comment ?? this.comment,
        importanceValue: importanceValue ?? this.importanceValue);
  }
}
