import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => new _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  void initState() {}
  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF242D3C), 
        body: ListView(
          children: []
        ));
  }
}
