import 'package:flutter/material.dart';
import 'package:trabalho_final/routes/game_details_page.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/routes/signup_screen.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/routes/search.dart';
import "package:trabalho_final/routes/login_screen.dart";
import 'package:trabalho_final/routes/developer_page.dart';
import 'package:trabalho_final/routes/publisher_page.dart';
import 'package:trabalho_final/routes/game_details_page.dart';

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
  State<MyHomePage> createState() =>
      _MyHomePageState(); // assim podemos criar statefullWidgets
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pages = [
    // um array com as paginas que podem ser acessadas apartir da BottomNavigationBar
    Homepage(),
    Search(),
  ];
  void _onItemTapped(int index) {
    // recebe uma variavel index do tipo inteira e atualiza o programa ao mesmo tempo que atribui o valor de index à variavel privada _selectedIndex
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            //mete as borders mais arredondadas
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          backgroundColor: backGroundColor, // cor do background
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Daw Dispositivos Moveis",
                    style: TextStyle(color: corPrimaria),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.03,
                    MediaQuery.of(context).size.height * 0.01,
                    MediaQuery.of(context).size.width * 0.03,
                    0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    // icon no inicio da tile
                    icon: Icon(Icons.check_circle),
                    onPressed: () => print('select'),
                  ),
                  title:
                      Text('Developers', style: TextStyle(color: Colors.white)),
                  trailing: Icon(
                    //icon após o tile
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeveloperPage()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.03,
                    MediaQuery.of(context).size.height * 0.01,
                    MediaQuery.of(context).size.width * 0.03,
                    0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.check_circle),
                    onPressed: () => print('select'),
                  ),
                  title:
                      Text('Publishers', style: TextStyle(color: Colors.white)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PublisherPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 70, //altura da appBar
          backgroundColor: backGroundColor,
          title: GestureDetector(
            onTap: () {
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            child: Wrap(
              //wrap faz mais ou menos o mesmo que o Row mas têm opções de espaçamento
              spacing: 0,
              runSpacing: 0,
              direction: Axis.horizontal,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    //container do botão
                    width: 141,
                    child: TextButton(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(corPrimaria),
                        fixedSize: MaterialStateProperty.all(Size(121, 40)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: _pages.elementAt(
              _selectedIndex), // vai buscar os elementos da pagina selecionada
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: corPrimaria),
          unselectedItemColor: lighterWhite,
          backgroundColor: colorNavBar,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: lighterWhite,
              ),
              label: 'Homepage',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: lighterWhite,
              ),
              label: 'Search',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: corPrimaria,
          onTap: _onItemTapped,
        ));
  }
}
