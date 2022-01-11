import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trabalho_final/routes/signup_screen.dart';
import 'package:trabalho_final/routes/welcome_screen.dart';
import 'package:trabalho_final/utilities/HashPassword.dart';
import 'package:trabalho_final/utilities/ReadStoredData.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/components/body.dart';
import 'package:trabalho_final/utilities/global_variables.dart';
import 'package:trabalho_final/utilities/validEmail.dart';
import 'package:trabalho_final/utilities/validPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => new _LoginScreen();
}

// error mensagem is to informe the user why is not makeing a login
var errorEmailMensagem = "";
var errorPasswordMensagem = "";
// defaul mensagem that show every time the user goes to the sign up page
var textFieldHintEmail = "Insira aqui o seu email";
var textFieldHintPass = "Insira aqui a sua Password";
// get the input the user use in the textField
TextEditingController emailTextController = TextEditingController();
TextEditingController passwordTextController = TextEditingController();

class _LoginScreen extends State<LoginScreen> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Opacity(
          opacity: 0.2,
          child: Container(
            height: size.height,
            width:
                double.infinity, // é a mesma coisa que o mediaQuery.of(context)
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/login.jfif"),
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
                    "LOGIN",
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
                          hintStyle: TextStyle(
                              color:
                                  Colors.grey[200]), //altera a cor do hint text
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
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
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
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------

                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("Login"),
                    ), // para o texto caber todo dentro do button sem quebrar
                    onPressed: login,
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
      ]),
    );
  }


  login() async {
    // save the input of the text field in a variabel to use later
    var email = emailTextController.text;
    var password = passwordTextController.text;
    // see if the email is a valide email
    var validEmail = validMail(email);
    //see if the password is valid
    var validPass = validPassword(password);
    // class to read the store libery in the device
    ReadStoredData readStoredData = new ReadStoredData();
    // get the password store in the device
    var comparePassword = await readStoredData.readStoredData(email);
    // make the erro preivew erro mensagem dissaper if the user failded to login
    errorEmailMensagem = "";
    errorPasswordMensagem = "";
    // class to make a hash of the password
    HashPassword hashPassword = new HashPassword();
    // make a hash of the password the user give to compare if is the same in the store
    var hashPass = hashPassword.passwordHash(password);

    setState(() {
      // see if the email is valid
      if (validEmail != "validEmail") {
        errorEmailMensagem = validEmail;
      }

      // see if the password is valid
      if (validPass != "validPassword") {
        errorPasswordMensagem = validPass;
      }

      if (validEmail == "validEmail" && validPass == "validPassword") {
        // check the value get by the class ReadStoreData (comparePassword) if the value is notFound the email does not exist in the device
        if (comparePassword == "notFound") {
          errorEmailMensagem = "email not found";
        } else {
          // see if the password thant the user give is the same as the in the store
          if (comparePassword == hashPass) {
            // set the global variables userEmail and userPassword the email and the password the user give
            userEmail = email;
            userPassword = hashPass;
            // go to the welcome page
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WelcomeScreen();
            }));
          } else {
            errorPasswordMensagem = "your Password is incorrect";
          }
        }
      }
    });
  }
}
