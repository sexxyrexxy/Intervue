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
  bool isListening = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    checkMicrophoneAvailability();
  }

  /// This has to happen only once per app
  /// Each time to start a speech recognition session
  void checkMicrophoneAvailability() async {
    bool available = await _speechToText.initialize();
    if (available) {
      setState(() {
        print('Microphone available: $available');
      });
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  Future<void> startListening() async {
    if (!isListening) {
      var available = await _speechToText.initialize();
      if (available) {
        setState(() {
          isListening = true;
        });
        _speechToText.listen(
          listenMode: ListenMode.dictation,
            listenFor: const Duration(minutes: 3),
            pauseFor: Duration(seconds: 10),
            onResult: (result) {
              setState(() {
                text = result.recognizedWords;
              });
            });
      }
    } else {
      setState(() {
        isListening = false;
      });
      _speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                child: GestureDetector(
                    onTap: () {
                      startListening();
                    },
                    child: const Icon(Icons.mic)),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: 600,
                  child: Text(
                    _speechToText.isListening
                        ? text
                        : isListening
                            ? 'Tap the microphone to start listening...'
                            : 'Speech not available',
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
        ),
      ),
    );
  }
}
