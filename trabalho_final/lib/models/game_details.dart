class GameDetails {
  String gameTitle;
  String gameDescripiton;
  String gameBackGroundImage;

  GameDetails({
    required this.gameTitle,
    required this.gameDescripiton,
    required this.gameBackGroundImage,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    return GameDetails(
      gameTitle: json['name'] ?? '',
      gameDescripiton: json['description'] ?? '',
      gameBackGroundImage: json['background_image'] ?? '',
    );
  }
}
