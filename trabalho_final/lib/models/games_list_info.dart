// this class is to save the list of games for the api and the nextpage for the next list
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