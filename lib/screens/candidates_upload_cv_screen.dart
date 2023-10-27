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
        child: Column(
          children: [
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.all(20),
            //   child: Image.asset('lib/assets/images/Intervue-Logo.png')
            // ),
            GestureDetector(
              onTap: () async {
                final result = await FilePickerWeb.platform.pickFiles();
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
