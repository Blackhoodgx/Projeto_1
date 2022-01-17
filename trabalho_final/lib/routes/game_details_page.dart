import 'dart:html';
import 'package:flutter/material.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/utilities/global_variables.dart';

class GameDetialsPage  extends StatefulWidget {
  @override
  _GameDetialsPage createState() => new _GameDetialsPage();
}

class _GameDetialsPage extends State<GameDetialsPage> {
  @override
  void initState() {}



  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF242D3C),
      body: Text("game details page, the id of the games is:" + idGame.toString()),
    );
  }
}