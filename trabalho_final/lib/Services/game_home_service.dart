import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/game_home.dart';
import 'package:trabalho_final/models/api_games_list.dart';
import 'package:trabalho_final/utilities/constants.dart';

class GameHomeService {
  Future getGames(urlListOfGames) async{
    final response = await http.get(Uri.parse(urlListOfGames));

    if(response.statusCode == 200){
      List<GameHome> gameHome = jsonDecode(response.body)
      ['results'].map<GameHome>((jsonItem) => GameHome.fromJson(jsonItem)).toList();

      String nextPage = jsonDecode(response.body)['next'];

      GamesListInfo gamesListInfo = new GamesListInfo(gamesList: gameHome, nextPage: nextPage);

      return gamesListInfo;
    }else{
      throw Exception("unenable to load games");
    }
  }
}