import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho_final/Services/publisher_list_service.dart';
import 'package:trabalho_final/models/publisher.dart';
import 'package:trabalho_final/models/publisher_list_info.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/widgets/publisher_list_Display.dart';

class PublisherPage extends StatefulWidget {
  @override
  _PublisherPage createState() => new _PublisherPage();
}

class _PublisherPage extends State<PublisherPage> {
  @override
  String nextPage = urlRawgPublisherDefault;
  List publisherList = <Publisher>[];
  bool enableLoadingCircle = true;
  final ScrollController _scrollController = ScrollController();
  void initState() {
    getListofPublishers(nextPage);
    super.initState();
    // check what the scroll is doing
    _scrollController.addListener(() {
      //see if the scroll reage the end of the page
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        getListofPublishers(nextPage);
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
              publisherList.length,
              (index) {
                return PublisherListDisplay(
                    publisher: publisherList[index], context: context);
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

// function to use the api, the function recieve the url that it will use
  Future<void> getListofPublishers(urlListOfPublishers) async {
    setState(() {
      enableLoadingCircle = true;
    });
    PublisherListService publisherListService = new PublisherListService();
    PublisherListInfo publisherListInfo =
        await publisherListService.getPublisher(urlListOfPublishers);
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      publisherList.addAll(publisherListInfo.getPublisherList);
      nextPage = publisherListInfo.getNextGame;
      enableLoadingCircle = false;
    });
  }
}
