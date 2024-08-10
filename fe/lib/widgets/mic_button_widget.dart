import 'package:fe/controllers/translate_controller.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:provider/provider.dart';

class MicButton extends StatefulWidget {
  final Function(String) onTextRecognized;

  MicButton({required this.onTextRecognized});

  @override
  _MicButtonState createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (!_isListening) {
              widget.onTextRecognized(_text);
              context.read<TranslateController>().translate(_text);
            }
          }),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
        widget.onTextRecognized(_text);
        context.read<TranslateController>().translate(_text);
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      context.read<TranslateController>().translate(_text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _listen,
      backgroundColor: _isListening ? Colors.red : Colors.blue,
      child: Icon(_isListening ? Icons.mic : Icons.mic_none),
    );
  }
}
