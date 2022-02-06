class GameDetails {
  String gameTitle;
  String gameDescrition;
  String gameBackGroundImage;
  List gameDeveloper;
  List gamePublisher;
  List gameTag;
  List gameGenre;
  List gamePlatforms;

  GameDetails({
    required this.gameTitle,
    required this.gameDescrition,
    required this.gameBackGroundImage,
    required this.gameDeveloper,
    required this.gamePublisher,
    required this.gamePlatforms,
    required this.gameGenre,
    required this.gameTag,
  });

  String get getGameTitle => this.gameTitle;
  String get getGameDescrition => this.gameDescrition;
  String get getgameBackGroundImage => this.gameBackGroundImage;
  List get getgameDeveloper => this.gameDeveloper;
  List get getgamePublisher => this.gamePublisher;
  List get getgamePlatforms => this.gamePlatforms;
  List get getgameGenre => this.gameGenre;
  List get getgameTag => this.gameTag;
}
