import 'dart:html' as html;
import 'dart:js_util' as js_util;
import 'dart:math';
import 'package:flutter/material.dart';

class SpeechToTextProvider {
  final speechRecognition = html.SpeechRecognition();
  String _recognizedWords = '';
  bool _isListening = false;

  String get recognizedWords => _recognizedWords;
  bool get isListening => _isListening;

  void startListening() async {
    _isListening = true;
    speechRecognition.continuous = true;
    speechRecognition.onResult.listen((event) => _onSpeechResult(event));
    speechRecognition.start();
  }

  void stopListening() async {
    _isListening = false;
    _recognizedWords = '';
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
    _recognizedWords = finalTranscript;
    print(_recognizedWords);
  }
}