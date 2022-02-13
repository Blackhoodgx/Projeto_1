import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trabalho_final/components/body.dart';
import 'package:trabalho_final/main.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/routes/login_screen.dart';
import 'package:trabalho_final/utilities/hash_password.dart';
import 'package:trabalho_final/utilities/store_data.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/utilities/global_variables.dart';
import 'package:trabalho_final/utilities/valid_email.dart';
import 'package:trabalho_final/utilities/valid_password.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => new _SignUpScreen();
}

// error mensagem is to informe the user why is not creating a account
var errorEmailMensagem = "";
var errorPasswordMensagem = "";
var errorRepeatPasswordMensagem = "";
// defaul mensagem that show every time the user enter the page
var textFieldHintEmail = "Insira aqui o seu email";
var textFieldHintPass = "Insira aqui a sua Password";
var textfielHintRepeatedPass = "Insira novamente a Password";
// get the input the user use in the textField
TextEditingController emailTextController = TextEditingController();
TextEditingController passwordTextController = TextEditingController();
TextEditingController repeatedPasswordController = TextEditingController();
final ScrollController _scrollController = ScrollController();

class _SignUpScreen extends State<SignUpScreen> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: corPrimaria,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          width: size.width,
          height: size.height,
          color: Color.fromRGBO(5, 5, 7, 1),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * .8,
                height: size.height * .6,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(size.width * .05, 0, 0, 2),
                        child: Text(
                          'REGISTAR',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: corPrimaria,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: size.width * .3,
                        height: 3,
                        color: corPrimaria,
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: size.width * .6,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'EMAIL',
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              color: Color.fromRGBO(3, 3, 3, 1),
                              child: TextFormField(
                                controller: emailTextController,
                                style: TextStyle(color: lighterWhite),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  fillColor: Color.fromRGBO(3, 3, 3, 1),
                                  suffix: Icon(
                                    Icons.email_outlined,
                                    color: lighterWhite,
                                  ),
                                  hintText: textFieldHintEmail,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    height: 2.5,
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'PASSWORD',
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              color: Color.fromRGBO(3, 3, 3, 1),
                              child: TextFormField(
                                controller: passwordTextController,
                                style: TextStyle(color: lighterWhite),
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  fillColor: Color.fromRGBO(3, 3, 3, 1),
                                  suffix: Icon(
                                    Icons.lock_outline,
                                    color: lighterWhite,
                                  ),
                                  hintText: textFieldHintPass,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    height: 2.5,
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'CONFIRME A PASSWORD',
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              color: Color.fromRGBO(3, 3, 3, 1),
                              child: TextFormField(
                                controller: repeatedPasswordController,
                                style: TextStyle(color: lighterWhite),
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  fillColor: Color.fromRGBO(3, 3, 3, 1),
                                  suffix: Icon(
                                    Icons.lock_outline,
                                    color: lighterWhite,
                                  ),
                                  hintText: textfielHintRepeatedPass,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    height: 2.5,
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: size.width * .3,
                                height: 40,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    registe();
                                  },
                                  child: Text(
                                    'CRIAR',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                  backgroundColor: corPrimaria,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment
                                  .centerLeft, //alinha o texto à esquerda
                              child: Text(
                                errorEmailMensagem,
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment
                                  .centerLeft, //alinha o texto à esquerda
                              child: Text(
                                errorPasswordMensagem,
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment
                                  .centerLeft, //alinha o texto à esquerda
                              child: Text(
                                errorRepeatPasswordMensagem,
                                style: TextStyle(
                                  color: lighterWhite,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: size.height * .05),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: lighterWhite,
                                      fontSize: 10,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'Já está registado? entre na sua conta',
                                      ),
                                      TextSpan(
                                        text: ' aqui',
                                        style: TextStyle(color: corPrimaria),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()),
                                            );
                                          },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
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
          return MyApp();
        }));
      }
    });
  }
}
