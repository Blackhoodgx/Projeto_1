class Platform {
  final String platformName;

  Platform({
    required this.platformName,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      platformName: json['name'] ?? '',
    );
  }
}
