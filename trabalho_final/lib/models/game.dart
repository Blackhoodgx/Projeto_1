class Game{
  final String gameTitle;
  final String gameBackgroundImage;
  final int gameId;


  Game({
    required this.gameTitle,
    required this.gameBackgroundImage,
    required this.gameId,
  });

  factory Game.fromJson(Map<String, dynamic> json){

    return Game(
      gameTitle: json['name'],
      gameBackgroundImage: json['background_image'],
      gameId:json['id'],
    );
  }

}