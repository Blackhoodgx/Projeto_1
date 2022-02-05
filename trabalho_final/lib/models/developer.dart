class Developer {
  //variaveis que precisa de ter
  final String developerName;
  final int developerNumberOfGames;

  Developer({
    // construtor se meter required ele obrigatoriamente tem de ter estes parametros
    required this.developerName,
    required this.developerNumberOfGames,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    // cria um mapa quase como se fosse um array
    return Developer(
      developerName: json['name'] ?? '',
      developerNumberOfGames: json['games_count'] ?? '',
    );
  }
}
