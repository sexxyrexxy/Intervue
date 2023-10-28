import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/widgets/candidate_info_text_field.dart';

class CandidatesUploadCV extends StatefulWidget {
  const CandidatesUploadCV({super.key});

  @override
  State<CandidatesUploadCV> createState() => _CandidatesUploadCVState();
}

class _CandidatesUploadCVState extends State<CandidatesUploadCV> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final educationController = TextEditingController();
  Image? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(color: secondaryDarkBlue, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final result = await FilePickerWeb.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf']);
                            if (result != null) {
                              setState(() {
                                fnameController.text = 'Rex';
                                lnameController.text = 'Lim';
                                phoneController.text = "0147593534";
                                emailController.text = 'rexlim2003@gmail.com';
                                educationController.text =
                                    "Bachelor's of Computer Science";
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            alignment: Alignment.center,
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              color: secondaryDarkBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Upload CV/Resume',
                              style: TextStyle(color: backgroundWhite),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.file_copy_rounded,
                          color: secondaryDarkBlue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'PDF (2MB)',
                          style: TextStyle(color: secondaryDarkBlue),
                        )
                      ],
                    ),
                    CandidatesInfoTextField('First Name', fnameController),
                    CandidatesInfoTextField('Last Name', lnameController),
                    CandidatesInfoTextField('Phone Number', phoneController),
                    CandidatesInfoTextField('Email Address', emailController),
                    CandidatesInfoTextField('Education', educationController),
                  ]),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal:150,vertical: 60),
            child: GestureDetector(
              onTap: () async {
                final result = await FilePickerWeb.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpeg', 'png', 'jpg']);
                if (result != null) {
                  final bytes = result
                      .files.single.bytes; // Get the file's content as bytes

                  if (bytes != null) {
                    final image = Image.memory(Uint8List.fromList(
                        bytes)); // Create an image from bytes

                    setState(() {
                      selectedImage = image;
                    });
                  }
                }
              },
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: selectedImage != null
                      ? FittedBox(fit:BoxFit.fill,child: selectedImage)
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo,size: 50,),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Upload your photo here',style: TextStyle(fontSize: 20),),
                        ],),),
            ),
          ))
        ],
      ),
    ));
  }
}
