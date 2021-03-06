import 'package:flutter/material.dart';
import 'package:trabalho_final/utilities/search_game_url.dart';
import 'package:trabalho_final/routes/developer_page.dart';
import 'package:trabalho_final/routes/search_result_page.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => new _Search();
}

class _Search extends State<Search> {
  @override
  void initState() {}
  var _formKey = GlobalKey<FormState>();
  var textFieldHintSeach = "Pesquisa aqui";
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1.0),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: MediaQuery.of(context).size.height * 0.14),
            child: TextField(
              onSubmitted: (value) {
                searchGamesResult(value);
              },
              controller: searchTextController,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(13, 13, 13, 1.0),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.search,
                    color: Color.fromRGBO(240, 240, 240, 1.0),
                  ),
                ),
                hintText: textFieldHintSeach,
                // style of the placeholder text, it does not affect the style of the text the user is typing
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(135, 135, 135, 1.0),
                ),
              ),
              // style of the text the user is typing, it only affect what the user is typing and doesn't affect the placeholder text
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> searchGamesResult(value) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchResult(searchTerme: value);
    }));
  }
}
