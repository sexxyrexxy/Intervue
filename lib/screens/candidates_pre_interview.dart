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
  CameraController? _controller;
  bool _isCameraInitialized = false;
  late final List<CameraDescription> _cameras;
  bool _isRecording = false;

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    // Initialize the camera with the first camera in the list
    await onNewCameraSelected(_cameras.first);
  }

  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }
    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Image.asset('lib/assets/images/intervue-logo.png', height: 80),
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
              // Container(
              //   width: 640,
              //   height: 320,
              //   decoration: BoxDecoration(
              //       color: Colors.amber,
              //       borderRadius: BorderRadius.circular(28)),
              // ),
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
          )
        ],
      ),
    );
  }
}
