import 'package:flutter/material.dart';
import 'package:trabalho_final/utilities/constants.dart';

class SearchResult extends StatefulWidget {
  @override
  final String searchTerme;
  const SearchResult({Key? key, required this.searchTerme}) : super(key: key);
  _SearchResult createState() => new _SearchResult();
}

class _SearchResult extends State<SearchResult> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext) {
    String searchTerme = widget.searchTerme;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 15),
            child: Text( "Result of " + searchTerme,
              style: TextStyle(
                fontSize: 20,
                color: corPrimaria,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
