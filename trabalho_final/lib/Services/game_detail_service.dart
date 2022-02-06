import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trabalho_final/models/Tag.dart';
import 'package:trabalho_final/models/developer.dart';
import 'package:trabalho_final/models/game_details.dart';
import 'package:trabalho_final/models/genre.dart';
import 'package:trabalho_final/models/platforms.dart';
import 'package:trabalho_final/models/publisher.dart';

class GameDetailService {
  Future getDetail(urlGameDetail) async {
    final response = await http.get(Uri.parse(urlGameDetail));

    if (response.statusCode == 200) {
      String gameTitle = jsonDecode(response.body)['next'] ?? '';
      String gameDescripiton = jsonDecode(response.body)['description']  ?? '';
      String gameBackGroundImage = jsonDecode(response.body)['background_image']  ?? '';

      List<Developer> gameDeveloper = jsonDecode(response.body)['developers']
        .map<Developer>((jsonItem) => Developer.fromJson(jsonItem))
        .toList();

      List<Tag> gameTags = jsonDecode(response.body)['tags']
        .map<Tag>((jsonItem) => Tag.fromJson(jsonItem))
        .toList();

      List<Genre> gameGenres = jsonDecode(response.body)['genres']
        .map<Genre>((jsonItem) => Genre.fromJson(jsonItem))
        .toList();

      List<Platforms> gamePlatforms = jsonDecode(response.body)['platforms']
        .map<Platforms>((jsonItem) => Platforms.fromJson(jsonItem))
        .toList();

      List<Publisher> gamePublisher = jsonDecode(response.body)['publishers']
        .map<Publisher>((jsonItem) => Publisher.fromJson(jsonItem))
        .toList();

        GameDetails gameDetails = new GameDetails(
          gameTitle: gameTitle,
          gameDescrition: gameDescripiton,
          gameBackGroundImage: gameBackGroundImage,
          gameDeveloper: gameDeveloper,
          gamePublisher: gamePublisher,
          gamePlatforms: gamePlatforms,
          gameGenre: gameGenres,
          gameTag: gameTags
          );

          return gameDetails;
    } else {
      throw Exception("unable to load games");
    }
  }
}
