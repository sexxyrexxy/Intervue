import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/widgets/camera.dart';
import 'package:talentsync/widgets/small-button.dart';
import 'package:talentsync/models/colors.dart' as custom_colors;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class PreInterviewScreen extends StatefulWidget {
  static const routeName = '/interview';
  const PreInterviewScreen({super.key});

  @override
  State<PreInterviewScreen> createState() => _PreInterviewScreenState();
}

class _PreInterviewScreenState extends State<PreInterviewScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller; //controller for camera
  bool _isCameraInitialized = false;
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String _currentWords = '';
  double _noiseLevel = 0.0;

  @override
  void initState() {
    loadCamera();
    super.initState();
    _initSpeech();
    _startListening();
    debugPrint("current status ${_speechToText.isNotListening.toString()}");
  }

  loadCamera() async {
    cameras = await availableCameras();
    _startListening();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("No any camera found");
    }
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(onStatus: statusListener);
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult,
        onSoundLevelChange: _onSoundLevelChange,
        listenMode: ListenMode.dictation);
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
      debugPrint("Hai $_lastWords");
    });
  }

  void _onSoundLevelChange(double level) {
    setState(() {
      _noiseLevel = level;
    });
  }

  void statusListener(String status) async {
    // if (status == "done" && _speechEnabled) {
    //   setState(() {
    //     _lastWords += " $_currentWords";
    //     _currentWords = "";
    //     _speechEnabled = false;
    //   });
    //   _startListening();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 36),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/assets/images/Intervue-logo.png', height: 80),
                smallButton(120, 40, custom_colors.secondaryDarkBlue,
                    Icons.arrow_forward_ios, "Start", 16)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Cameras(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Interview Question \n will be shown here.',
                      style: TextStyle(
                          fontSize: 28,
                          color: custom_colors.primaryBlue,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          size: 24,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "A few tips before proceeding:",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Make sure that your surrounding \nenvironment is well-lit",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Avoid rooms with noisy backgrounds",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Make sure that your surrounding \nenvironment is well-lit",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "When you're ready, click the 'Start' button \nlocated top right",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              _lastWords.isNotEmpty
                  ? _lastWords
                  : "[Live Caption will show up when you speak]",
              style: TextStyle(fontSize: 16, color: custom_colors.primaryBlue),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.mic,
                        size: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        _noiseLevel.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.photo_camera_front, size: 32),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        controller == null
                            ? "Loading Camera"
                            : !controller!.value.isInitialized
                                ? "Please open your camera"
                                : "Your Camera is working properly",
                        style: TextStyle(
                            fontSize: 20,
                            color: !controller!.value.isInitialized
                                ? Colors.red
                                : Colors.green),
                      )
                    ],
                  ),
                  SizedBox(width: 32),
                  Row(
                    children: [
                      Icon(
                        Icons.volume_up_outlined,
                        size: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 180,
                        height: 52,
                        decoration: BoxDecoration(
                            color: custom_colors.primaryBlue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Play a sound",
                            style: TextStyle(
                                color: custom_colors.backgroundWhite,
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
