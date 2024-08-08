import 'package:fe/services/translate_service.dart';
import 'package:flutter/material.dart';

class TranslateController extends ChangeNotifier {
  String _sourceText = '';
  String _translatedText = '';
  String _sourceLang = 'EN';
  String _targetLang = 'ES';
  final TranslateService _translateService = TranslateService();

  String get sourceText => _sourceText;
  String get translatedText => _translatedText;
  String get sourceLang => _sourceLang;
  String get targetLang => _targetLang;

  void setSourceLang(String lang) {
    _sourceLang = lang;
    notifyListeners();
  }

  void setTargetLang(String lang) {
    _targetLang = lang;
    notifyListeners();
  }

  void swapLanguages() {
    final temp = _sourceLang;
    _sourceLang = _targetLang;
    _targetLang = temp;
    notifyListeners();
  }

  void translate(String text) async {
    _sourceText = text;
    _translatedText =
        await _translateService.translate(text, _sourceLang, _targetLang);
    notifyListeners();
  }
}
