class Publisher {
  // criação do objeto Publisher
  final String publisherName;
  final int publisherNumberOfGames;

  Publisher({
    required this.publisherName,
    required this.publisherNumberOfGames,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) {
    // função que transforma o json apartir do publisher e é um objeto json o formato que nós recebemos é do tipo string:dynamic
    return Publisher(
      publisherName: json['name'] ?? '',
      publisherNumberOfGames: json['games_count'] ?? '',
    );
  }
}
