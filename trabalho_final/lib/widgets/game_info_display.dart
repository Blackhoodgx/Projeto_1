import 'package:flutter/material.dart';
import 'package:trabalho_final/models/game_details.dart';

class GameDetailsDisplay extends StatelessWidget {
  const GameDetailsDisplay({
    Key? key,
    required this.info,
    required this.context,
  }) : super(key: key);

  final GameDetails info;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    if (info.gameBackGroundImage.isEmpty) {
      imageUrl = 'assets/images/image_not_found.png';
    } else {
      imageUrl = info.gameBackGroundImage;
    }
    return Container(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.network(imageUrl),
                ),
                Text(
                  info.gameTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
