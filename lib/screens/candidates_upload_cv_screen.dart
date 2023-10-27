import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CandidatesUploadCV extends StatelessWidget {
  const CandidatesUploadCV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: GestureDetector(
          onTap: () async {
            final result = await FilePickerWeb.platform.pickFiles();
          },
          child: Container(
            
            width: 50,
            height: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
