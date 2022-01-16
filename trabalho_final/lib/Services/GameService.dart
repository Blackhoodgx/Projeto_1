import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/GameHome.dart';
import 'package:trabalho_final/utilities/constants.dart';

class GameService {
  Future getGames() async{
    final response = await http.get(Uri.parse(urlRawgDefault));

    if(response.statusCode == 200){
      List<GameHome> gameHome = jsonDecode(response.body)
      ['results'].map<GameHome>((jsonItem) => GameHome.fromJson(jsonItem)).toList();

      return gameHome;
    }else{
      throw Exception("unenable to load games");
    }
  }
}