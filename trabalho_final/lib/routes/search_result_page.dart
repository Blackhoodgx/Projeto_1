import 'package:flutter/material.dart';
import 'package:trabalho_final/Services/games_list_service.dart';
import 'package:trabalho_final/models/games_list_info.dart';
import 'package:trabalho_final/models/game.dart';
import 'package:trabalho_final/utilities/search_game_url.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/widgets/games_list_display.dart';

class SearchResult extends StatefulWidget {
  @override
  final String searchTerme;
  const SearchResult({Key? key, required this.searchTerme}) : super(key: key);
  _SearchResult createState() => new _SearchResult(searchTerme);
}

class _SearchResult extends State<SearchResult> {
  String terme;
  _SearchResult(this.terme);
  @override
  List gamesInHomePage = <Game>[];
  bool enableLoadingCircle = true;
  String? nextPage = null;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    SearchGameUrl searchGameUrl = new SearchGameUrl();
    searchGameUrl.addSearchTermeToUrl = terme;
    nextPage = searchGameUrl.getSearchUrl;
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

  @override
  Widget build(BuildContext) {
    String searchTerme = widget.searchTerme;
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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.067),
            child: GridView.count(
              controller: _scrollController,
              crossAxisCount: 2, // (number of elements in a row)
              childAspectRatio: .75,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.067,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.067,
              children: List.generate(
                gamesInHomePage.length,
                (index) {
                  return GamesListDisplay(
                      game: gamesInHomePage[index], content: context);
                },
              ),
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
