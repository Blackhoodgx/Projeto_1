import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trabalho_final/models/game_details.dart';
import 'package:trabalho_final/utilities/constants.dart';

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
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(255, 255, 255, 0.10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                info.gameTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.75),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            info.gameDescripiton,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
