import 'package:trabalho_final/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

// it use in the home_page and search_result_page do to the games infomation in its page by the same
class GamesListDisplay extends StatelessWidget {
  const GamesListDisplay({
    Key? key,
    required this.game,
    required this.content,
  }) : super(key: key);

  // the object game contain the game informantion
  final Game game;
  final BuildContext content;

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    imageUrl = game.gameBackgroundImage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GameDetialsPage(idGame: game.gameId.toString());
                    }));
                  },
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.fitHeight,
                    imageUrl: imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(
                        color: corPrimaria,
                      ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/image_not_found.png',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameDetialsPage(idGame: game.gameId.toString());
              }));
            },
            child: Text(
              game.gameTitle,
              style: TextStyle(
                fontSize: 11.0,
                color: Color.fromRGBO(130, 130, 130, 1.0),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: RatingBarIndicator(
            // adiciona o widget das estrelas
            rating: game.gameRating,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 15.0,
            direction: Axis.horizontal,
          ),
          // child: Text(
          //   game.gameRating.toString(),
          //   style: TextStyle(
          //     fontSize: 12.0,
          //     color: lighterWhite,
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.w200,
          //   ),
          // ),
        ),
      ],
    );
  }
}
