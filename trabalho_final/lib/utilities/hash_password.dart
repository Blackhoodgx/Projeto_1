import 'package:crypto/crypto.dart';
import 'dart:convert';

class HashPassword {
  String passwordHash(password) {
    var passEncode = utf8.encode(password); // data being encode (data can be decode)
    
    var passHash = sha256.convert(passEncode); // data being hash (data can't be decode)
    
    String stringHash = passHash.toString(); // convert and save passHash value in a strign;

    return stringHash;
  }
}
