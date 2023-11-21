import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_bullet_list/bullet_list.dart';
import 'package:talentsync/widgets/camera.dart';
import 'package:talentsync/widgets/small-button.dart';
import 'package:talentsync/models/colors.dart' as custom_colors;
import 'package:talentsync/providers/speechtotext_provider.dart';

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
  var speechRecognitionComponent = SpeechToTextProvider();

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    speechRecognitionComponent.startListening();
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
                Cameras(800, 450),
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
                    SuperBulletList(
                        iconSize: 24,
                        isOrdered: false,
                        crossAxisMargin: 0.0,
                        customBullet: Icon(
                          Icons.warning_amber_rounded,
                          size: 24,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        items: [
                          Text(
                            "A few tips before proceeding:",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 16),
                          )
                        ]),
                    SizedBox(
                      height: 12,
                    ),
                    SuperBulletList(
                        gap: 25,
                        iconColor: custom_colors.black.withOpacity(0.3),
                        isOrdered: false,
                        crossAxisMargin: 12.0,
                        items: [
                          Text(
                            "Make sure that your surrounding \nenvironment is well-lit",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 16),
                          ),
                          Text(
                            "Avoid rooms with noisy backgrounds",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 16),
                          ),
                          Text(
                              "Make eye contact by looking at the \n camera instead of screen. ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 16))
                        ]),
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
              speechRecognitionComponent.recognizedWords.isNotEmpty
                  ? speechRecognitionComponent.recognizedWords
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
                        "0.0",
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
