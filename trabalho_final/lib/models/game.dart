class Game {
  final String gameTitle;
  final String gameBackgroundImage;
  final int gameId;
  final double gameRating;

  Game({
    required this.gameTitle,
    required this.gameBackgroundImage,
    required this.gameId,
    required this.gameRating,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        gameTitle: json['name'] ?? '',
        gameBackgroundImage: json['background_image'] ?? '',
        gameId: json['id'] ?? '',
        gameRating: json['rating'] ?? '');
  }
}
