import 'package:flutter/material.dart';
import 'package:trabalho_final/routes/login_screen.dart';
import 'package:trabalho_final/routes/signup_screen.dart';
import 'package:trabalho_final/utilities/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
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
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text("Sign up"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpScreen();
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
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
