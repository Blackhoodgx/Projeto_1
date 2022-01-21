import 'dart:convert';
import 'package:trabalho_final/models/game_detail.dart';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/utilities/constants.dart';

class GameDetailService {
  Future fetchGameDetail() async {
    final response = await http.get(Uri.parse(urlRawgGameDetail));
    if (response.statusCode == 200) {
      List<GameDetail> gameDetail = jsonDecode(response.body)['']
          .map<GameDetail>((jsonItem) => GameDetail.fromJson(jsonItem))
          .toList();
          return gameDetail;  
    }else {
      throw Exception('Failed!!!!!');
    }
  }
}
