import 'package:trabalho_final/models/platform.dart';
class Platforms {
  final List<Platform> platform;

  Platforms({
    required this.platform,
  });

  factory Platforms.fromJson(Map<String, dynamic> json) {
    List<Platform> gameAvalebleIn = json['platform']
    .map<Platform>((jsonItem) => Platform.fromJson(jsonItem)).toList();

    return Platforms(
      platform: gameAvalebleIn,
    );
  }
}
