class GameHome{
  final String gameTitle;
  final String gameBackgroundImage;
  final int gameId;


  GameHome({
    required this.gameTitle,
    required this.gameBackgroundImage,
    required this.gameId,
  });

  factory GameHome.fromJson(Map<String, dynamic> json){

    return GameHome(
      gameTitle: json['name'],
      gameBackgroundImage: json['background_image'],
      gameId:json['id'],
    );
  }

}