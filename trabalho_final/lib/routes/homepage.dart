import 'dart:html';
import 'package:flutter/material.dart';
import 'package:trabalho_final/Services/games_list_service.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/models/games_list_info.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/widgets/games_list_display.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => new _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  String nextPage = urlRawgDefault;
  List gamesInHomePage = <Game>[];
  bool enableLoadingCircle = true;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    getListofGames(nextPage);
    super.initState();
    // check what the scroll is doing
    _scrollController.addListener(() {
      //see if the scroll reage the end of the page
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        getListofGames(nextPage);
      }
    });
  }

  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Stack(
        children: [
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
            left: (MediaQuery.of(context).size.width * 0.50) - 20,
            child: Visibility(
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

// function to use the api, the function recive the url that it will use
  Future<void> getListofGames(urlListOfGames) async {
    setState(() {
      enableLoadingCircle = true;
    });
    GamesListService gameslistService = new GamesListService();
    GamesListInfo gamesListInfo =
        await gameslistService.getGames(urlListOfGames);
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      gamesInHomePage.addAll(gamesListInfo.getGamesList);
      nextPage = gamesListInfo.getNextgame;
      enableLoadingCircle = false;
    });
  }
}