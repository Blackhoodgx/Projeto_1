import 'package:trabalho_final/utilities/constants.dart';

class SearchGameUrl {
  String searchUrl = urlRawgDefault;
  SearchGameUrl();

  void set addSearchTermeToUrl(String searchTerme){
    searchUrl = '$urlRawgDefault&search=$searchTerme';
  }

  String get getSearchUrl => this.searchUrl;

}
