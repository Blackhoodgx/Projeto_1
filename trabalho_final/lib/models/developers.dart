import 'dart:convert';

class Developers {
  final int id;
  final String imageBackground;

  Developers({
    required this.id,
    required this.imageBackground,
  });
factory Developers.fromJson(Map<String, dynamic> json){
  return Developers(
    id: json['id'], 
    imageBackground: json ['image_background'],);
}
}