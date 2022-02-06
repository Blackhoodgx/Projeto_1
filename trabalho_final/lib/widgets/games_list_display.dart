import 'package:trabalho_final/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/routes/game_details_page.dart';

class GamesListDisplay extends StatelessWidget {
  const GamesListDisplay({
    Key? key,
    required this.game,
    required this.content,
  }) : super(key: key);

  final Game game;
  final BuildContext content;

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    if (game.gameBackgroundImage.isEmpty) {
      imageUrl = 'assets/images/image_not_found.png';
    } else {
      imageUrl = game.gameBackgroundImage;
    }
    return Container(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          TextButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) {
                //return GameDetialsPage(idGame: game.gameId.toString());
              //}));
            },
            child: Text(
              game.gameTitle,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
