import 'package:trabalho_final/models/developers.dart';

class GameDetail {
  final int gameId;
  final String name;
/*   final String backgroundImage;
  final String description;
  final String releasedDate;
  final String rating;
  final List<Developers> developers; */

  GameDetail({
    required this.gameId,
    required this.name,
/*    required this.background_image,
    required this.description,
    required this.releasedDate,
    required this.rating,
    required this.developers, */
  });
  factory GameDetail.fromJson(Map<String, dynamic> json) {
/*     List<Developers> tempDevelopers = json['developers']
        .map<Developers>((jsonItem) => Developers.fromJson(jsonItem))
        .toList(); */
    return GameDetail(
      gameId: json['id'],
      name: json['name'],
    /*   background_image: json['background_image'],
      description: json['description'],
      releasedDate: json['released'],
      rating: json['rating'],
      developers: tempDevelopers, */
    );
  }
}
