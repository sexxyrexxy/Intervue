import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/screens/candidates_answering_screen.dart';
import 'package:talentsync/widgets/candidate_info_text_field.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class CandidatesUploadCV extends StatefulWidget {
  static const routeName = '/uploadCV';
  const CandidatesUploadCV({super.key});

  @override
  State<CandidatesUploadCV> createState() => _CandidatesUploadCVState();
}

class _CandidatesUploadCVState extends State<CandidatesUploadCV> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  var pickedFile;
  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load(
        'https://firebasestorage.googleapis.com/v0/b/intervue-my.appspot.com/o/pdfs%2FCVMay2023.pdf?alt=media&token=d29fabac-15e2-48eb-a5ba-7c99a0628df8');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  void uploadFile() async {
    if (pickedFile != null) {
      final String fileName = pickedFile!.files[0].name;
      final fileBytes = pickedFile.files.first.bytes;
      // print(pickedFile?.files.first.bytes);

      await FirebaseStorage.instance.ref("pdfs/$fileName").putData(fileBytes!);
      final downloadlink =
          await FirebaseStorage.instance.ref("pdfs/$fileName").getDownloadURL();

      print("Pdf uploaded succesfully");
      await _firebaseFirestore
          .collection("pdfs")
          .add({"name": fileName, "url": downloadlink});

      print("Pdf anjeng succesfully");
    } else {
      throw "Cancelled File Picker";
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("pdfs").get();

    pdfData = results.docs.map((e) => e.data()).toList();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllPdf();
    super.initState();
  }

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
                            pickedFile = await FilePickerWeb.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);
                            var fileBytes = '/Users/rexlim/Desktop';
                            print(fileBytes);
                            //Load an existing PDF document.
                            PdfDocument document = PdfDocument(
                                inputBytes: await _readDocumentData(
                                    'pdf_succinctly.pdf'));
                            PdfTextExtractor extractor =
                                PdfTextExtractor(document);

                            String ok = extractor.extractText();
                            print(ok);
                            String text = "";
                            text = await ReadPdfText.getPDFtext(
                                'https://firebasestorage.googleapis.com/v0/b/intervue-my.appspot.com/o/pdfs%2FCVMay2023.pdf?alt=media&token=d29fabac-15e2-48eb-a5ba-7c99a0628df8');
                            print(text);
                            if (pickedFile != null) {
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CandidatesAnsweringScreen.routeName);
                        uploadFile();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryDarkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(280, 56),
                      ),
                      child: Text(
                        'Interview Now',
                        style: TextStyle(
                          color: backgroundWhite,
                          fontSize: 20,
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 60),
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
                    ? FittedBox(fit: BoxFit.cover, child: selectedImage)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            size: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Upload your photo here',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
