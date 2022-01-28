import 'dart:html';
import 'package:flutter/material.dart';
import 'package:trabalho_final/Services/game_home_service.dart';
import 'package:trabalho_final/models/game_home.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/models/api_games_list.dart';
import 'package:trabalho_final/utilities/constants.dart';


class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => new _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  String nextPage = urlRawgDefault;
  List gamesInHomePage = <GameHome>[];
  bool enableLoadingCircle  = true;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    getListofGames(nextPage);
    super.initState();
    // check what the scroll is doing
    _scrollController.addListener(() { 
      //see if the scroll reage the end of the page
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
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
        body: Stack(children: [
          GridView.count(
          controller: _scrollController,
            crossAxisCount: 2, // (number of elements in a row)
            mainAxisSpacing: MediaQuery.of(context).size.height *
                0.04, // (horizontal space between elements)
            crossAxisSpacing: MediaQuery.of(context).size.width *
                0.11, // (vertical space between elements)
            children: List.generate(
              gamesInHomePage.length,
              (index) {
                return GamesListDisplay(
                    game: gamesInHomePage[index], content: context);
              },
            ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left:(MediaQuery.of(context).size.width * 0.50) - 20,
              child:Visibility(
              visible: enableLoadingCircle,
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                color: corPrimaria,
              ),
              ),
              ),
              ),
        ],
        ),
            );
  }

//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------

// function to use the api, the function recive the url that it will use
  Future<void> getListofGames(urlListOfGames) async {
    setState(() {
      enableLoadingCircle = true;
    });
    GameHomeService gameHomeService = new GameHomeService();
    GamesListInfo gamesListInfo = await gameHomeService.getGames(urlListOfGames);
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      gamesInHomePage.addAll(gamesListInfo.getGamesList);
      nextPage = gamesListInfo.getNextgame;
      enableLoadingCircle = false;
    });
  }
}

class GamesListDisplay extends StatelessWidget {
  const GamesListDisplay({
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
            height: MediaQuery.of(context).size.height * 0.14,
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
