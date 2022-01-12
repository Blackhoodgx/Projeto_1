import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => new _Search();
}

class _Search extends State<Search> {
  @override
  void initState() {}
  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242D3C),
    body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.07,
            vertical: MediaQuery.of(context).size.height*0.14),
            child: TextField(

            ),
        ),
      
    ]));
  }
}