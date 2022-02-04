import 'dart:html';
import 'package:flutter/material.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/utilities/global_variables.dart';

class GameDetialsPage  extends StatefulWidget {
  @override
  final String idGame;
  const GameDetialsPage({Key? key, required this.idGame}) : super(key: key);
  _GameDetialsPage createState() => new _GameDetialsPage();
}

class _GameDetialsPage extends State<GameDetialsPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context){
    String idGame =  widget.idGame;
    return Scaffold(
      backgroundColor: Color(0xFF242D3C),
      body: Text("game details page, the id of the games is:" + idGame),
    );
  }
}