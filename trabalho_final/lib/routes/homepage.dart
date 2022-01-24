import 'dart:html';

import 'package:flutter/material.dart';
import 'package:trabalho_final/Services/game_home_service.dart';
import 'package:trabalho_final/models/game_home.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/utilities/api_games_list.dart';
import 'package:trabalho_final/utilities/global_variables.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => new _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  List gamesInHomePage = <GameHome>[];
  void initState() {
    _getGameHome();
    super.initState();
  }

  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF242D3C),
        body: GridView.count(
            crossAxisCount: 2, // (number of elements in a row)
            mainAxisSpacing: MediaQuery.of(context).size.height *
                0.04, // (horizontal space between elements)
            crossAxisSpacing: MediaQuery.of(context).size.width *
                0.11, // (vertical space between elements)
            children: List.generate(
              gamesInHomePage.length,
              (index) {
                return GameDisplay(
                    game: gamesInHomePage[index], content: context);
              },
            )));
  }

  Future<void> _getGameHome() async {
    GameHomeService gameHomeService = new GameHomeService();
    ApiGamesList newGames = await gameHomeService.getGames();
    setState(() {
      gamesInHomePage = newGames.getGameList;
      String nextPage = newGames.getNextgame;
      print(nextPage);
    });
  }
}

class GameDisplay extends StatelessWidget {
  const GameDisplay({
    Key? key,
    required this.game,
    required this.content,
  }) : super(key: key);

  final GameHome game;
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
            height: MediaQuery.of(context).size.height * .14,
          ),
          TextButton(
            onPressed: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameDetialsPage(idGame: game.gameId.toString());
              }));
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
          //Text(game.gameId.toString()),
        ],
      ),
    );
  }
}
