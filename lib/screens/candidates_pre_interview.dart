import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/widgets/camera.dart';
import 'package:talentsync/widgets/small-button.dart';
import 'package:talentsync/models/colors.dart' as custom_colors;

class PreInterviewScreen extends StatefulWidget {
  const PreInterviewScreen({super.key});

  @override
  State<PreInterviewScreen> createState() => _PreInterviewScreenState();
}

class _PreInterviewScreenState extends State<PreInterviewScreen> {
  List<CameraDescription>? cameras;
  CameraController? controller; //controller for camera
  bool _isCameraInitialized = false;
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
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
        padding: EdgeInsets.symmetric(horizontal: 52, vertical: 36),
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
                Camera(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Interview Question \n will be shown here.',
                      style: TextStyle(
                          fontSize: 24,
                          color: custom_colors.primaryBlue,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          size: 20,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "A few tips before proceeding:",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3), fontSize: 12),
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
                              fontSize: 28, color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Make sure that your surrounding \nenvironment is well-lit",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3), fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 28, color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Avoid rooms with noisy backgrounds",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3), fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 28, color: Colors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Make sure that your surrounding \nenvironment is well-lit",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3), fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "When you're ready, click the 'Start' \nbutton located top right",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "[Live Caption will show up when you speak]",
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
                      Icon(Icons.mic),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Noise Meter here",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.photo_camera_front),
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
                            fontSize: 12,
                            color: !controller!.value.isInitialized
                                ? Colors.red
                                : Colors.green),
                      )
                    ],
                  ),
                  SizedBox(width: 32),
                  Row(
                    children: [
                      Icon(Icons.volume_up_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 160,
                        height: 32,
                        decoration: BoxDecoration(
                            color: custom_colors.primaryBlue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Play a sound",
                            style: TextStyle(
                                color: custom_colors.backgroundWhite,
                                fontSize: 12),
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
