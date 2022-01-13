import 'package:flutter/material.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/routes/search.dart';
import "package:trabalho_final/routes/login_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pages = [
    Homepage(),
    Search(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF242D3C),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xFF4EB947),
              ),
              label: 'Homepage',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color(0xFF4EB947),
              ),
              label: 'Search',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[0xFF4EB947],
          onTap: _onItemTapped,
        ));
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          AppBar(
              shape: Border(
                  bottom: BorderSide(
                      color: corPrimaria,
                      width:
                          40)), // aparece no final da pagina corrigir isto sem falta@@@@@@@@@@@@@@@@@@@@@@@@
              toolbarHeight: 85,
              title: Text(
                "DAW APP",
                style: TextStyle(color: corPrimaria),
              ),
              backgroundColor: backGroundColor,
              leading: GestureDetector(
                  onTap: () {},
                  child: Center(
                      child: Container(
                    width: MediaQuery.of(context).size.height * 0.05,
                    height: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: corPrimaria, width: 2)),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ))),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: ButtonBar(children: [
                    TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: corPrimaria, width: 2.0),
                            ),
                          ),
                        )),
                    TextButton(
                        child: Text(
                          'Registar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: corPrimaria, width: 2.0),
                            ),
                          ),
                        ))
                  ]),
                ),
              ]),
          Opacity(
            opacity: 0.2,
            child: Container(
              height: size.height,
              width: double
                  .infinity, // é a mesma coisa que o mediaQuery.of(context)
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/unnamed.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  primary: corPrimaria,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
