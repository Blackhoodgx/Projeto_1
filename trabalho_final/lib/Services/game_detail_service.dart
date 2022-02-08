import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/game_details.dart';

class GameDetailService {
  Future getDetail(urlGameDetail) async {
    final response = await http.get(Uri.parse(urlGameDetail));

    if (response.statusCode == 200) {
      String gameTitle = jsonDecode(response.body)['name'] ?? '';
      String gameDescripiton = jsonDecode(response.body)['description'] ?? '';
      String gameDescrip = gameDescripiton.replaceAll(RegExp('<p>'), '');
      gameDescripiton = gameDescrip.replaceAll(RegExp('</p>'), '');
      String gameBackGroundImage =
          jsonDecode(response.body)['background_image'] ?? '';

      GameDetails gameDetails = new GameDetails(
        gameTitle: gameTitle,
        gameDescripiton: gameDescripiton,
        gameBackGroundImage: gameBackGroundImage,
      );

      return gameDetails;
    } else {
      throw Exception("unable to load games");
    }
  }
}
