class DeveloperListInfo {
  List developerList;
  String nextPage;

  DeveloperListInfo({
    required this.developerList,
    required this.nextPage
  });

  String get getNextGame => this.nextPage;
  List get getDeveloperList =>this.developerList;

}