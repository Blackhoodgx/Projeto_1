import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/game_home.dart';
import 'package:trabalho_final/utilities/api_games_list.dart';
import 'package:trabalho_final/utilities/constants.dart';

class GameHomeService {
  Future getGames(urlListOfGames) async{
    final response = await http.get(Uri.parse(urlListOfGames));

    if(response.statusCode == 200){
      List<GameHome> gameHome = jsonDecode(response.body)
      ['results'].map<GameHome>((jsonItem) => GameHome.fromJson(jsonItem)).toList();

      String nextPage = jsonDecode(response.body)['next'];

      ApiGamesList apiGamesList = new ApiGamesList(gameList: gameHome, nextPage: nextPage);

      return apiGamesList;
    }else{
      throw Exception("unenable to load games");
    }
  }
}