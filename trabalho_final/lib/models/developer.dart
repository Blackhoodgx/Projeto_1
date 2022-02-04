class Developer {
  final String developerName;
  final String developerBackGroundImage;

  Developer({
    required this.developerName,
    required this.developerBackGroundImage,
  });

  factory Developer.fromJson(Map<String, dynamic> json){

    return Developer(
      developerName: json['name'] ?? '', 
      developerBackGroundImage: json['image_background'] ?? '', 
      );
  }

}