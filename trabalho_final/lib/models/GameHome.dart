class GameHome{
  final String gameTitle;
  final String gameBackgroundImage;


  GameHome({
    required this.gameTitle,
    required this.gameBackgroundImage,
  });

  factory GameHome.fromJson(Map<String, dynamic> json){

    return GameHome(
      gameTitle: json['name'],
      gameBackgroundImage: json['background_image'],
    );
  }

}