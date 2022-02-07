import 'package:trabalho_final/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/routes/game_details_page.dart';

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
    if (game.gameBackgroundImage.isEmpty) {
      imageUrl = 'assets/images/image_not_found.png';
    } else {
      imageUrl = game.gameBackgroundImage;
    }
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
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Text(
            '4.5',
            style: TextStyle(
              fontSize: 12.0,
              color: lighterWhite,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
    // return Container(
    //   child: Column(
    //     children: [
    //       Image.network(
    //         imageUrl,
    //         width: MediaQuery.of(context).size.width * 0.35,
    //         height: MediaQuery.of(context).size.height * 0.14,
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           //Navigator.push(context, MaterialPageRoute(builder: (context) {
    //             //return GameDetialsPage(idGame: game.gameId.toString());
    //           //}));
    //         },
    //         child: Text(
    //           game.gameTitle,
    //           style: TextStyle(
    //             fontSize: 20,
    //             fontFamily: 'Poppins',
    //             fontWeight: FontWeight.w400,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
