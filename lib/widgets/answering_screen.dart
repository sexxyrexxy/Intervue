import 'dart:async';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
// import 'package:talentsync/providers/speechtotext_provider.dart';
import 'package:talentsync/widgets/camera.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../models/candidates_model.dart';
import '../models/colors.dart';
import '../providers/candidate_provider.dart';
import '../providers/position_provider.dart';
import 'dart:html' as html;
import 'dart:js_util' as js_util;
import 'dart:math';

class AnsweringScreen extends StatefulWidget {
  String position;
  String question;
  Function()? action;
  AnsweringScreen(
      {required this.position, required this.question, this.action});

  @override
  State<AnsweringScreen> createState() => _AnsweringScreenState();
}

// var speechRecognitionComponent = SpeechToTextProvider();
final CountdownController _controller = CountdownController(autoStart: false);
bool _isLoading = true;
bool listening = false;

class _AnsweringScreenState extends State<AnsweringScreen> {
  final speechRecognition = html.SpeechRecognition();
  String _recognizedWords = '';
  bool _isListening = false;

  String get recognizedWords => _recognizedWords;
  bool get isListening => _isListening;

  @override
  void initState() {
    Provider.of<CandidatesProvider>(context, listen: false)
        .fetchCandidateData()
        .then(
      (_) {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
    super.initState();
  }

  void startListening() async {
    _isListening = true;
    speechRecognition.continuous = true;
    speechRecognition.onResult.listen((event) => _onSpeechResult(event));
    speechRecognition.start();
  }

  void stopListening() async {
    _isListening = false;
    speechRecognition.stop();
  }

  void clear() {
    _recognizedWords = "";
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

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CandidatesProvider>(context, listen: false);
    CandidateModel currentCandidate =
        Provider.of<CandidatesProvider>(context, listen: false)
            .candidateProviderData;
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    Future<void> exampleAI() async {
      // Set the OpenAI API key from the .env file.
      OpenAI.apiKey = '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';

      // Start using!
      final completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        maxTokens: 40,
        prompt: """
                I am interviewing a candidate for ${widget.position}. 
                The question is ${widget.question}. The response is ${recognizedWords}.
                Please give me a very specific follow up qeustion. Strictly do not give any prefix in your response such as 'Answer:' or 'Qeustion:'
                """,
      );
      positionProvider.addQuestion(
          widget.position, completion.choices[0].text, 1);

      print(completion.choices[0].text);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.question,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          CameraCard(800, 500),
          Countdown(
            // controller: _controller,
            seconds: 180,
            controller: _controller,
            build: (_, double time) => Text(
              time.toString() + " seconds left",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            interval: const Duration(seconds: 1),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Timer is done!'),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              listening
                  ? GestureDetector(
                      onTap: () {
                        stopListening();

                        _controller.pause();
                        setState(() {
                          listening = false;
                        });
                        print('listen');
                      },
                      child: const Icon(Icons.pause_circle, size: 50))
                  : GestureDetector(
                      onTap: () {
                        _controller.start();
                        startListening();
                        setState(() {
                          listening = true;
                        });
                        print('listen');
                      },
                      child: const Icon(
                        Icons.play_circle_fill,
                        size: 50,
                      ))
            ],
          ),
          //
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Timer(Duration(seconds: 3), () {
                  _provider
                      .updateQuestions(widget.question, recognizedWords)
                      .then((_) {
                    stopListening();
                    _recognizedWords = "";
                  });
                });
                if (widget.question == "Tell me a little bit about yourself") {
                  exampleAI();
                  widget.action!();
                } else {
                  widget.action!();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryDarkBlue),
                child: const Text(
                  'Next Question',
                  style: TextStyle(color: backgroundWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
