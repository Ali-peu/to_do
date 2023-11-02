class CategoryNote {
  int id;
  String category;

  CategoryNote({
    required this.id,
    required this.category,
  });

  factory CategoryNote.fromJson(Map<String, dynamic> json) {
    return CategoryNote(
      id: json['id'],
      category: json['category'],
    );
  }
}
