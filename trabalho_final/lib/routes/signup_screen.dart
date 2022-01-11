import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trabalho_final/components/body.dart';
import 'package:trabalho_final/routes/login_screen.dart';
import 'package:trabalho_final/routes/welcome_screen.dart';
import 'package:trabalho_final/utilities/HashPassword.dart';
import 'package:trabalho_final/utilities/StoreData.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/utilities/global_variables.dart';
import 'package:trabalho_final/utilities/validEmail.dart';
import 'package:trabalho_final/utilities/validPassword.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => new _SignUpScreen();
}

// error mensagem is to informe the user why is not creating a account
var errorEmailMensagem = "";
var errorPasswordMensagem = "";
var errorRepeatPasswordMensagem = "";
// defaul mensagem that show every time the user goes to the sign up page
var textFieldHintEmail = "Insira aqui o seu email";
var textFieldHintPass = "Insira aqui a sua Password";
var textfielHintRepeatedPass = "Insira novamente a Password";
// get the input the user use in the textField
TextEditingController emailTextController = TextEditingController();
TextEditingController passwordTextController = TextEditingController();
TextEditingController repeatedPasswordController = TextEditingController();

class _SignUpScreen extends State<SignUpScreen> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                      image: AssetImage("assets/images/registar.jfif"),
                      fit: BoxFit.cover)),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: corPrimaria,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 276,
                    height: 224,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/image_not_found.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            color: null,
                            border: Border.all(color: corPrimaria, width: 1),
                            borderRadius: BorderRadius.horizontal()),
                        child: TextField(
                          controller: emailTextController,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[200]),
                            hintText: textFieldHintEmail,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      corPrimaria), //quando se carrega muda a cor inferior dentro da textbox
                            ),
                          ),
                        ),
                      ),
                      Text(
                        errorEmailMensagem,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  // password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            color: null,
                            border: Border.all(color: corPrimaria, width: 1),
                            borderRadius: BorderRadius.horizontal()),
                        child: TextField(
                          controller: passwordTextController,
                          obscureText: true, //não mostra a password
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[200]),
                            hintText: textFieldHintPass,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      corPrimaria), //quando se carrega muda a cor inferior dentro da textbox
                            ),
                          ),
                        ),
                      ),
                      Text(
                        errorPasswordMensagem,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //second password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "confirmar Password",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 19, vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            color: null,
                            border: Border.all(color: corPrimaria, width: 1),
                            borderRadius: BorderRadius.horizontal()),
                        child: TextField(
                          controller: repeatedPasswordController,
                          obscureText: true, //não mostra a password
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[200]),
                            hintText: textfielHintRepeatedPass,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      corPrimaria), //quando se carrega muda a cor inferior dentro da textbox
                            ),
                          ),
                        ),
                      ),
                      Text(
                        errorRepeatPasswordMensagem,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  //----------------------------------------------------------------------
                  // bottom Sign up
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text("Register"),
                      ), // para o texto caber todo dentro do button sem quebrar
                      //-----------------------------------------------
                      //-----------------------------------------------
                      // faz o registo
                      onPressed: registe,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 2, color: corPrimaria), //border do button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: corPrimaria.withOpacity(0),
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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

  registe() {
    setState(() {
      // make the erro preivew erro mensagem dissaper if the user failded to sign up
      errorEmailMensagem = "";
      errorPasswordMensagem = "";
      errorRepeatPasswordMensagem = "";
      // save the input of the text field in a variabel to use later
      var email = emailTextController.text;
      var password = passwordTextController.text;
      var repeatedPassword = repeatedPasswordController.text;
      // see if the email is a valide email
      var validEmail = validMail(email);
      //see if the password is valid
      var validPass = validPassword(password);
      // see if the second password is the same as the first
      bool samePass = false;
      // class to save data in the device
      StoreData storeData = new StoreData();
      // class to make a hash of the password
      HashPassword hashPassword = new HashPassword();

      // show erro mensagem if the email is not valid
      if (validEmail != "validEmail") {
        errorEmailMensagem = validEmail;
      }

      // show erro mensagem if the password is not valid
      if (validPass != "validPassword") {
        errorPasswordMensagem = validPass;
      }

      // show erro mensagem if the second password is diferente than the first, if is the same change samepass to true
      if (repeatedPassword != password) {
        errorRepeatPasswordMensagem = "please enter the same password";
      } else {
        samePass = true;
      }

      //print("same is {$samePass}");

      if (validEmail == "validEmail" &&
          validPass == "validPassword" &&
          samePass) {
        // make a hash of the password
        var hashPass = hashPassword.passwordHash(password);
        // store the hash password on the device
        storeData.storeData(email, hashPass);
        //errorPasswordMensagem = "sign up it sucess.";
        //print("check");
        userEmail = email;
        userPassword = hashPass;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WelcomeScreen();
        }));
      }
    });
  }
}
