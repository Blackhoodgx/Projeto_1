import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trabalho_final/main.dart';
import 'package:trabalho_final/routes/homepage.dart';
import 'package:trabalho_final/routes/signup_screen.dart';
import 'package:trabalho_final/utilities/hash_password.dart';
import 'package:trabalho_final/utilities/read_stored_data.dart';
import 'package:trabalho_final/utilities/constants.dart';
import 'package:trabalho_final/components/body.dart';
import 'package:trabalho_final/utilities/global_variables.dart';
import 'package:trabalho_final/utilities/valid_email.dart';
import 'package:trabalho_final/utilities/valid_password.dart';
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
          //container do quadrado preto fundo do ecrã (background)
          width: size.width,
          height: size.height,
          color: Color.fromRGBO(5, 5, 7, 1),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              //container do quadrado preto no centro do ecrã
              width: size.width * .8, // .8 vai buscar 80% da largura do ecran
              height: size.height * .6, // .6 vai buscar 60% altura do ecran
              color: Colors.black,
              child: Column(
                // faz com que os elementos fiquem alinhados uns abaixo dos outros
                mainAxisAlignment: MainAxisAlignment
                    .center, // por default todos os elementos vão para o centro
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    // alinha o LOGIN á esquerda
                    alignment: Alignment.topLeft,
                    child: Container(
                      // container do text
                      padding: EdgeInsets.fromLTRB(size.width * .05, 0, 0, 2),
                      child: Text(
                        'LOGIN',
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
                    // retangulo abaixo do Text (sim é um retangulo)
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: size.width * .3,
                      height: 3,
                      color: corPrimaria,
                      margin: EdgeInsets.only(bottom: 20),
                    ),
                  ),
                  Align(
                    // alinha os containers que tem o text de username; o text field e igualmente para a password
                    alignment: Alignment.center,
                    child: Container(
                      //container que leva os restantes elementos da página
                      width: size.width *
                          .6, //para ficar com 60% da largura total dando assim margens à esquerda e à direita
                      child: Column(
                        children: [
                          
                          Container(
                            alignment: Alignment
                                .centerLeft, //alinha o texto à esquerda
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
                              // quadrado onde se escreve o texto
                              style: TextStyle(color: lighterWhite),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 20, 0),
                                fillColor: Color.fromRGBO(3, 3, 3, 1),
                                suffix: Icon(
                                  // icon que apareçe quando clicamos no textformfield do username ( prefixo apareçe antes e sufixo apareçe depois)
                                  Icons.person,
                                  color: lighterWhite,
                                ),
                                hintText: textFieldHintEmail,
                                hintStyle: TextStyle(
                                  height: 2.5,
                                  fontSize: 13,
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
                            // alignment á direita para o botão "entrar"
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: size.width * .3,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  login();
                                },
                                child: Text(
                                  'ENTRAR',
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: size.height * .1),
                              child: RichText(
                                // permite a customização de segmentos de texto individuais
                                text: TextSpan(
                                  style: TextStyle(
                                    color: lighterWhite,
                                    fontSize: 10,
                                  ),
                                  children: [
                                    TextSpan(
                                      //segmento de texto individual sem espaçamento
                                      text:
                                          'Ainda não está registado? registe-se',
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
                                                    SignUpScreen()),
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
              return MyApp();
            }));
          } else {
            errorPasswordMensagem = "your Password is incorrect";
          }
        }
      }
    });
  }
}
