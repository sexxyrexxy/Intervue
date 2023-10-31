import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Cameras extends StatefulWidget {
  const Cameras({
    super.key,
  });

  @override
  State<Cameras> createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> {
  List<CameraDescription>? cameras;
  CameraController? controller; //controller for camera
  XFile? image;
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 450,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
      child: controller == null
          ? Center(child: Text("Loading Camera..."))
          : !controller!.value.isInitialized
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CameraPreview(controller!),
    );
  }

  void loadCamera() async {
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
      print("NO any camera found");
    }
  }

  void initCamera() {
    loadCamera();
  }
}
