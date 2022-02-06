// this class is to save the list of developer for the api and the nextpage for the next list
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