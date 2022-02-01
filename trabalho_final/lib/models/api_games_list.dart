class GamesListInfo {
  List gamesList;
  String nextPage;

  GamesListInfo({
    required this.gamesList,
    required this.nextPage
  });

  String get getNextgame => this.nextPage;
  List get getGamesList =>this.gamesList;
}