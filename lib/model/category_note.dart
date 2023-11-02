class CategoryNote {
  String category;

  CategoryNote({
    required this.category,
  });

  factory CategoryNote.fromJson(Map<String, dynamic> json) {
    return CategoryNote(
      category: json['category'],
    );
  }
}
