import 'dart:html';
import 'package:flutter/material.dart';
import 'package:trabalho_final/services/game_detail_service.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/models/game_details.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/utilities/game_details_url.dart';
import 'package:trabalho_final/widgets/game_info_display.dart';

class GameDetialsPage extends StatefulWidget {
  @override
  final String idGame;
  const GameDetialsPage({Key? key, required this.idGame}) : super(key: key);
  _GameDetialsPage createState() => new _GameDetialsPage(idGame);
}

class _GameDetialsPage extends State<GameDetialsPage> {
  String id;
  _GameDetialsPage(this.id);
  @override
  bool enableLoadingCircle = true;
  String? gameUrl = null;
  List gameInfo = <GameDetails>[];
  final ScrollController _scrollController = ScrollController();
  void initState() {
    GameDetailsUrl gameDetailsUrl = GameDetailsUrl();
    gameDetailsUrl.addIdNumber = id;
    gameUrl = gameDetailsUrl.getGameDetailsUrls;
    getGamesInfo(gameUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: corPrimaria,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: backGroundColor,
      body: ListView(
        controller: _scrollController,
        children: List.generate(
          gameInfo.length,
          (index) {
            return GameDetailsDisplay(info: gameInfo[index], context: context);
          },
        ),
      ),
    );
  }

  Future<void> getGamesInfo(urlGameDetail) async {
    setState(() {
      enableLoadingCircle = true;
    });
    GameDetailService gameDetailService = new GameDetailService();
    GameDetails gameDetails = await gameDetailService.getDetail(urlGameDetail);
    setState(() {
      gameInfo.add(gameDetails);
      enableLoadingCircle = false;
    });
  }
}
