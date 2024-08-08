import 'package:fe/controllers/translate_controller.dart';
import 'package:fe/widgets/mic_button_widget.dart';
import 'package:fe/models/language_mapping.dart';
import 'package:fe/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translate App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TranslateController>(
          builder: (context, controller, child) {
            return Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: SearchableDropdown(
                        value: languageMap.keys.firstWhere(
                          (key) => languageMap[key] == controller.sourceLang,
                          orElse: () => 'English (US)',
                        ),
                        items: languageMap.keys.toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setSourceLang(languageMap[newValue]!);
                          }
                        },
                        hint: "Select source language",
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.swap_horiz),
                      onPressed: () {
                        controller.swapLanguages();
                      },
                    ),
                    Expanded(
                      child: SearchableDropdown(
                        value: languageMap.keys.firstWhere(
                          (key) => languageMap[key] == controller.targetLang,
                          orElse: () => 'English (US)',
                        ),
                        items: languageMap.keys.toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setTargetLang(languageMap[newValue]!);
                          }
                        },
                        hint: "Select target language",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter text to translate',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.translate(_textEditingController.text);
                  },
                  child: Text('Translate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Translated Text:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.translatedText,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MicButton(
                  onTextRecognized: (String text) {
                    _textEditingController.text = text;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
