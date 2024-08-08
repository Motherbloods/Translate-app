import 'package:fe/models/transalation_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TranslateService {
  final String _baseUrl = dotenv.env['URL'] ?? '';

  Future<String> translate(
      String text, String sourceLang, String targetLang) async {
    print(
        'ini text ${text} ini source lang ${sourceLang} ini target lang ${targetLang}');
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/translate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'text': text, 'sourceLang': sourceLang, 'targetLang': targetLang}),
      );

      if (response.statusCode == 200) {
        return Translation.fromJson(jsonDecode(response.body)).text;
      } else {
        print('Failed to translate text. Status code: ${response.statusCode}');
        throw Exception('Failed to translate text');
      }
    } catch (error) {
      print('Error occurred: $error');
      throw error;
    }
  }
}
