import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:talentsync/providers/speechtotext_provider.dart';
import 'package:talentsync/widgets/camera.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../models/candidates_model.dart';
import '../models/colors.dart';
import '../providers/candidate_provider.dart';
import '../providers/position_provider.dart';

class AnsweringScreen extends StatefulWidget {
  String position;
  String question;
  Function()? action;
  AnsweringScreen(
      {required this.position, required this.question, this.action});

  @override
  State<AnsweringScreen> createState() => _AnsweringScreenState();
}

var speechRecognitionComponent = SpeechToTextProvider();
final CountdownController _controller = CountdownController(autoStart: false);
bool _isLoading = true;

class _AnsweringScreenState extends State<AnsweringScreen> {
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
                The question is ${widget.question}. The response is ${speechRecognitionComponent.recognizedWords}.
                Please give me a very specific follow up qeustion.
                """,
      );
      positionProvider.addQuestion(
          widget.position, completion.choices[0].text, 1);

      print(completion.choices[0].text);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.question,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Cameras(800, 500),
          Countdown(
            // controller: _controller,
            seconds: 180,
            controller: _controller,
            build: (_, double time) => Text(
              time.toString() + " seconds left",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            interval: Duration(seconds: 1),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Timer is done!'),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.start();
                    speechRecognitionComponent.startListening();
                    print('listen');
                  },
                  child: const Icon(
                    Icons.play_circle_fill,
                    size: 50,
                  )),
              GestureDetector(
                  onTap: () {
                    speechRecognitionComponent.stopListening();
                    _controller.pause();
                    print('listen');
                  },
                  child: const Icon(Icons.pause_circle, size: 50)),
            ],
          ),
          //
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                _provider.updateQuestions(widget.question,
                    speechRecognitionComponent.recognizedWords);
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
          ),
        ],
      ),
    );
  }
}
