import 'package:flutter/material.dart';
import 'package:talentsync/providers/speechtotext_provider.dart';

class SpeechToTextTest extends StatefulWidget {
  const SpeechToTextTest({Key? key}) : super(key: key);

  @override
  _SpeechToTextTest createState() => _SpeechToTextTest();
}

class _SpeechToTextTest extends State {
  var speechRecognitionComponent = SpeechToTextProvider();

  @override
  void initState() {
    super.initState();
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
                onPressed: () {
                  if (speechRecognitionComponent.isListening == false) {
                    speechRecognitionComponent.startListening();
                  } else {
                    speechRecognitionComponent.stopListening();
                  }
                },
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
                speechRecognitionComponent.recognizedWords.isNotEmpty
                    ? speechRecognitionComponent.recognizedWords
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
