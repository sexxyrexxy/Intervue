import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraCard extends StatefulWidget {
  double width;
  double height;
  CameraCard(
    this.width,
    this.height, {
    super.key,
  });

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  List<CameraDescription>? cameras;
  CameraController? controller; //controller for camera
  XFile? image;
  @override
  void initState() {
    loadCamera();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
      child: controller == null
          ? const Center(child: Text("Loading Camera..."))
          : !controller!.value.isInitialized
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CameraPreview(controller!),
    );
  }
}
