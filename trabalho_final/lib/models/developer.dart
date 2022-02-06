class Developer {
  final String developerName;
  final int developerNumberOfGames;

  Developer({
    required this.developerName,
    required this.developerNumberOfGames,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      developerName: json['name'] ?? '',
      developerNumberOfGames: json['games_count'] ?? '',
    );
  }
}
