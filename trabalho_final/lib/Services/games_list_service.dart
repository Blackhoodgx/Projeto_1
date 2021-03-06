import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/models/games_list_info.dart';
import 'package:trabalho_final/utilities/constants.dart';

class GamesListService {
  Future getGames(urlListOfGames) async{
    final response = await http.get(Uri.parse(urlListOfGames));

    if(response.statusCode == 200){
      List<Game> games = jsonDecode(response.body)
      ['results'].map<Game>((jsonItem) => Game.fromJson(jsonItem)).toList();

      String nextPage = jsonDecode(response.body)['next'];

      // gameListInfo serve to save the gamesList info and the url to the next page do to the info be in different leves
      GamesListInfo gamesListInfo = new GamesListInfo(gamesList: games, nextPage: nextPage);

      return gamesListInfo;
    }else{
      throw Exception("unable to load games");
    }
  }
}