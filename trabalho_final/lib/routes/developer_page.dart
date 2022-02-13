import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho_final/services/developer_list_service.dart';
import 'package:trabalho_final/models/developer.dart';
import 'package:trabalho_final/models/developer_list_info.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/widgets/developer_list_display.dart';

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
      appBar: AppBar(
        backgroundColor: backGroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: corPrimaria,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
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
