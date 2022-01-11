import 'package:trabalho_final/utilities/HashPassword.dart';
import 'package:trabalho_final/utilities/validEmail.dart';
import 'package:trabalho_final/utilities/validPassword.dart';


// this test file is to validate the password test the hash

void main() {
print("testing the password check");
// test to see if class ValidatePassword word properly
  List<String> testPassword = [
    "a", // check if the password have 8 or more characters
    "SLYCOPPER",   // check if password have a lowercase letter 
    "slycopper",   // check if password have a upercase letter
    "slyCopper",   // check if password have a number
    "slyCopper2",  // check if password have a special character
    "slyCopper5?"  // it a valid password
  ];


  testPassword.forEach((test) {
    print(validPassword(test));
  });

//-----------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------


  print("-------------------------------------------------");
  print("-------------------------------------------------");
  print("testing hash to see if it works propely");
  // this test is to see if class HashPassword can hash a password
  String testHash = "slyCopper5?";
  HashPassword hashPassword = new HashPassword();
  print(hashPassword.passwordHash(testHash));

//-----------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------


  print("-------------------------------------------------");
  print("-------------------------------------------------");
  print("testing the email check");

  List<String> testEmail = [
    "slymailcom",   // check if the email have a @
    "sly@mailcom",  // check if the email have a dot
    "sly@mail.com", // valid email
  ];

  // test if the email given is a email
  testEmail.forEach((email) {
    print(validMail(email));
  });


}
