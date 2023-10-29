import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextTest extends StatefulWidget {
  const SpeechToTextTest({Key? key}) : super(key: key);

  @override
  _SpeechToTextTest createState() => _SpeechToTextTest();
}


class _SpeechToTextTest extends State {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String _currentWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
        onStatus: statusListener
    );
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult, listenMode: ListenMode.dictation);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  void statusListener(String status) async {
    debugPrint("status $status");
    if (status == "done" && _speechEnabled) {
      setState(() {
        _lastWords += " $_currentWords";
        _currentWords = "";
        _speechEnabled = false;
      });
      _startListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: FloatingActionButton(
                    onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
                    tooltip: 'Start/Stop',
                    child: const Icon(Icons.mic)
                ),
              ),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: 600,
                  child: Text(
                    _speechToText.isListening ? _lastWords : _speechEnabled ? 'Tap the microphone to start listening...' : 'Speech not available',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]
        ),
      ],
    );
  }
}