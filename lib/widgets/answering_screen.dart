import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:talentsync/widgets/camera.dart';

import '../models/colors.dart';
import '../providers/position_provider.dart';

class AnsweringScreen extends StatefulWidget {
  String question;
  Function()? action;
  AnsweringScreen(this.question, this.action, {super.key});

  @override
  State<AnsweringScreen> createState() => _AnsweringScreenState();
}

final SpeechToText _speechToText = SpeechToText();
bool isListening = false;
String text = '';

class _AnsweringScreenState extends State<AnsweringScreen> {
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
  void initState() {
    super.initState();
    checkMicrophoneAvailability();
  }

  @override
  Widget build(BuildContext context) {
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    Future<void> exampleAI() async {
      // Set the OpenAI API key from the .env file.
      OpenAI.apiKey = 'XXXXXX';

      // Start using!
      final completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        maxTokens: 40,
        prompt: """
                I am interviewing a candidate for software engineer. 
                The question is ${widget.question}. The response is ${text}.
                Please give me a very specific follow up qeustion.
                """,
      );
      positionProvider.addQuestionsAtIndex(
          'Software Engineer', completion.choices[0].text);

      print(completion.choices[0].text);
    }

    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Cameras(800, 540),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  startListening();
                  print('listen');
                },
                child: const Icon(Icons.mic)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                widget.action!();
                print('next');
                if (widget.question == "Tell me a little bit about yourself") {
                  exampleAI();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryDarkBlue),
                child: Text(
                  'Next Question',
                  style: TextStyle(color: backgroundWhite),
                ),
              ),
            ),
          ],
        ));
  }
}
