class Publisher {
  final String publisherName;
  final int publisherNumberOfGames;

  Publisher({
    required this.publisherName,
    required this.publisherNumberOfGames,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) {
    return Publisher(
      publisherName: json['name'] ?? '',
      publisherNumberOfGames: json['games_count'] ?? '',
    );
  }
}
