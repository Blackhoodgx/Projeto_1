class Genre {
  final String genreName;

  Genre({
    required this.genreName,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      genreName: json['name'] ?? '',
    );
  }
}
