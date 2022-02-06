import 'package:trabalho_final/utilities/constants.dart';

class GameDetailsUrl {
  String detailsUrl = urlGameDetailsDefault;
  GameDetailsUrl();

  // sawp the word id in the url to the id number of the game to have a function url
  void set addIdNumber(String idNumber){
    detailsUrl = detailsUrl.replaceFirst(RegExp('id'), idNumber);
  }

  String get getGameDetailsUrls => this.detailsUrl;
}