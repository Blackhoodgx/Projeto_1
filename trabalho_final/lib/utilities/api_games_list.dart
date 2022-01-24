class ApiGamesList {
  List gameList;
  String nextPage;

ApiGamesList({
  required this.gameList,
  required this.nextPage
});



String get getNextgame => this.nextPage;
List get getGameList =>this.gameList;



}