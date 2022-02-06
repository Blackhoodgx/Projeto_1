class Tag {
  final String tagName;

  Tag({
    required this.tagName,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagName: json['name'] ?? ''
    );
  }
}
