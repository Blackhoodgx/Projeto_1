import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho_final/Services/developer_list_service.dart';
import 'package:trabalho_final/models/developer.dart';
import 'package:trabalho_final/models/developer_list_info.dart';
import 'package:trabalho_final/utilities/constants.dart';

class DeveloperPage extends StatefulWidget {
  @override
  _DeveloperPage createState() => new _DeveloperPage();
}

class _DeveloperPage extends State<DeveloperPage> {
  @override
  String nextPage = urlRawgDeveloperDefault;
  List developersList = <Developer>[];
  bool enableLoadingCircle = true;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    getListofDevelopers(nextPage);
    super.initState();
    // check what the scroll is doing
    _scrollController.addListener(() {
      //see if the scroll reage the end of the page
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        getListofDevelopers(nextPage);
      }
    });
  }

    var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();

  //stop building the scroll controller
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

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
              developersList.length,
              (index) {
                return DeveloperListDisplay(
                    developer: developersList[index], context: context);
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
  Future<void> getListofDevelopers(urlListOfDevelopers) async {
    setState(() {
      enableLoadingCircle = true;
    });
    DeveloperListService developerListService = new DeveloperListService();
    DeveloperListInfo developerListInfo =
        await developerListService.getDevelopers(urlListOfDevelopers);
        await Future.delayed(Duration(seconds: 4));
        setState(() {
          developersList.addAll(developerListInfo.getDeveloperList);
          nextPage = developerListInfo.getNextGame;
          enableLoadingCircle = false;
    });
  }
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

class DeveloperListDisplay extends StatelessWidget {
  const DeveloperListDisplay({
  Key? key,
    required this.developer,
    required this.context,
  }) : super(key: key);

  final Developer developer;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    if (developer.developerBackGroundImage.isEmpty) {
      imageUrl = 'assets/images/image_not_found.png';
    } else {
      imageUrl = developer.developerBackGroundImage;
    }
    return Container(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          Text(
              developer.developerName,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          //Text(game.gameId.toString()),
        ],
      ),
    );
  }
}



