import 'dart:html';

import 'package:flutter/material.dart';
import 'package:trabalho_final/Services/game_home_service.dart';
import 'package:trabalho_final/models/game_home.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/utilities/api_games_list.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/utilities/global_variables.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => new _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  String nextPage = urlRawgDefault;
  List gamesInHomePage = <GameHome>[];
  final ScrollController _scrollController = ScrollController();
  void initState() {
    getListofGames(nextPage);
    super.initState();
    // check what the scroll is doing
    _scrollController.addListener(() { 
      //see if the scroll reage the end of the page
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
        print("****************************************++++++++++++++++++++++++++++++++++++++");
        print("LOADING NEXT PAGE?");
        print("NEXT URL IS"+nextPage);
        print("****************************************+++++++++++++++++++++++++++++");
        getListofGames(nextPage);
      }
    });
  }

  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();

  //stop building the scroll controller
  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF242D3C),
        body: GridView.count(
          controller: _scrollController,
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

  Future<void> getListofGames(urlListOfGames) async {
    GameHomeService gameHomeService = new GameHomeService();
    ApiGamesList ListofGames = await gameHomeService.getGames(urlListOfGames);
    setState(() {
      gamesInHomePage = ListofGames.getGameList;
      nextPage = ListofGames.getNextgame;
      print("00000000000000000000000000000000000000000000000000");
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
