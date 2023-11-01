import 'dart:html' as html;
import 'dart:js_util' as js_util;
import 'dart:math';

import 'package:flutter/material.dart';

class SpeechToTextTest extends StatefulWidget {
  const SpeechToTextTest({Key? key}) : super(key: key);

  @override
  _SpeechToTextTest createState() => _SpeechToTextTest();
}

class _SpeechToTextTest extends State {
  final speechRecognition = html.SpeechRecognition();
  String _lastWords = '';
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
  }

  void _startListening() async {
    setState(() {
      _isListening = true;
    });
    speechRecognition.continuous = true;
    speechRecognition.onResult.listen((event) => _onSpeechResult(event));
    speechRecognition.start();
  }

  void _stopListening() async {
    setState(() {
      _isListening = false;
      _lastWords = '';
    });
    speechRecognition.stop();
  }

  void _onSpeechResult(html.SpeechRecognitionEvent event) {
    var results = event.results;
    if (null == results) return;
    var longestAlt = 0;
    var finalTranscript = "";
    for (var recognitionResult in results) {
      if (null == recognitionResult.length || recognitionResult.length == 0) {
        continue;
      }

      for (var altIndex = 0;
          altIndex < (recognitionResult.length ?? 0);
          ++altIndex) {
        longestAlt = max(longestAlt, altIndex);
        var alt = js_util.callMethod(recognitionResult, 'item', [altIndex]);
        if (null == alt) continue;
        String? transcript = js_util.getProperty(alt, 'transcript');
        finalTranscript += transcript ?? "";
      }
    }
    setState(() {
      _lastWords = finalTranscript;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text(
              'Test Speech-To-Text',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: FloatingActionButton(
                onPressed: !_isListening ? _startListening : _stopListening,
                tooltip: 'Start/Stop',
                child: const Icon(Icons.mic)),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: SizedBox(
              width: 600,
              child: Text(
                _lastWords.isNotEmpty
                    ? _lastWords
                    : 'Tap the microphone to start listening...',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
