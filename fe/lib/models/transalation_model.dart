class Translation {
  final String text;

  Translation({required this.text});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      text: json['translatedText'],
    );
  }
}
