import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/providers/openAI_4_provider.dart';
import 'package:talentsync/screens/candidates_answering_screen.dart';
import 'package:talentsync/screens/candidates_pre_interview.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'package:talentsync/widgets/candidate_info_text_field.dart';
import '../auth.dart';
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class CandidatesUploadCV extends StatefulWidget {
  static const routeName = '/uploadCV';
  const CandidatesUploadCV({super.key});

  @override
  State<CandidatesUploadCV> createState() => _CandidatesUploadCVState();
}

class _CandidatesUploadCVState extends State<CandidatesUploadCV> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var pickedFile;

  Future<List<int>> readDocumentData(ByteData bytedata) async {
    return bytedata.buffer
        .asUint8List(bytedata.offsetInBytes, bytedata.lengthInBytes);
  }

  ByteData? convertFilePickerResultToByteData(FilePickerResult? result) {
    if (result != null && result.files.isNotEmpty) {
      List<int> fileBytes = result.files.first.bytes ?? [];
      return ByteData.sublistView(Uint8List.fromList(fileBytes));
    }
    return null;
  }

  Future<String> exampleAI(String text) async {
    // Set the OpenAI API key from the .env file.
    OpenAI.apiKey = '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';

    // Start using!
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      maxTokens: 500,
      prompt: """
                I am giving you a resume broken down into text. Analyze it, summarize, and return in JSON format. 
                Strictly only extract first name, last name, phone number, email, education and strictly only 5 skills and experiences.
                Give no extra information other than that. 
                Here is the text : ${text}.
                the response you give will be used as json in code, make your response a valid json please. Strictly do not give any prefix in your response such as 'Answer:"
                Do it in the strict JSON format and example of below, make sure the keys are exactly right:
                {
                                    "First Name": "Ronalds",
                                    "Last Name": "Lim",
                                    "Email": "rexlim2003@gmail.com",
                                    "Phone Number": "+60 14 759 3534",
                                    "Education": "Bachelor's of Computer Science",
                                    "Skills": ["Application Development", "Flutter", "Firebase"]
                                    "Experience": ["7 years of working experience",
                                                    "Worked with AirAsia, Uber and Amazon",
                                                    "Working with large language model and artificial intelligence",
                                                    "Degree from Taylor's University"]
                                  }
                
                Skills and experience are lists. Put company names under experience if applicable.
                """,
    );

    print(completion.choices[0].text);
    return completion.choices[0].text;
  }

  void pickImage() async {
    final result = await FilePickerWeb.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpeg', 'png', 'jpg']);
    if (result != null) {
      final String imgName = result.files[0].name;
      final bytes =
          result.files.single.bytes; // Get the file's content as bytes

      if (bytes != null) {
        final image = Image.memory(
            Uint8List.fromList(bytes)); // Create an image from bytes
        setState(() {
          selectedImage = image;
        });
      }
      await FirebaseStorage.instance.ref("imgs/$imgName").putData(bytes!);
      final imgDownloadlink =
          await FirebaseStorage.instance.ref("imgs/$imgName").getDownloadURL();
      print("img uploaded succesfully");
      Provider.of<CandidatesProvider>(context, listen: false).setImgDetails(
          imgExtractedModel(imgName: imgName, imgUrl: imgDownloadlink));
      print("img anjeng succesfully");
    }
  }

  // Pick file function
  void uploadFiles() async {
    if (pickedFile?.files.first.bytes != null) {
      final String fileName = pickedFile!.files[0].name;
      final fileBytes = pickedFile.files.first.bytes;
      // print(pickedFile?.files.first.bytes);

      await FirebaseStorage.instance.ref("pdfs/$fileName").putData(fileBytes!);
      final downloadlink =
          await FirebaseStorage.instance.ref("pdfs/$fileName").getDownloadURL();

      print("Pdf uploaded succesfully");
      Provider.of<CandidatesProvider>(context, listen: false).setPdfDetails(
          pdfExtractedModel(pdfName: fileName, pdfUrl: downloadlink));

      print("Pdf anjeng succesfully");
    } else {
      throw "Cancelled File Picker";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
    var _provider = Provider.of<CandidatesProvider>(context, listen: false);
    CandidateModel currentCandidate =
        Provider.of<CandidatesProvider>(context, listen: false)
            .defaultCandidate;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: secondaryDarkBlue,
                      fontSize: 20),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              pickedFile = await FilePickerWeb.platform
                                  .pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf']);

                              ByteData byteFile =
                                  convertFilePickerResultToByteData(
                                      pickedFile)!;

                              PdfDocument documentTry = PdfDocument(
                                  inputBytes: await readDocumentData(byteFile));

                              PdfTextExtractor extractor =
                                  PdfTextExtractor(documentTry);
                              String text = extractor.extractText();
                              Map<String, dynamic> jsonMap =
                                  json.decode(await exampleAI(text));
                              // String inputString = """{
                              //         "First Name": "Ronalds",
                              //         "Last Name": "Lim",
                              //         "Email": "rexlim2003@gmail.com",
                              //         "Phone Number": "+60 14 759 3534",
                              //         "Education": "Bachelor's of Computer Science",
                              //         "Skills": ["Application Development", "Flutter", "Firebase"]
                              //       }""";

                              // Map<String, dynamic> jsonMap =
                              //     json.decode(inputString);

                              // Accessing individual properties
                              String firstName = jsonMap['First Name'];
                              String lastName = jsonMap['Last Name'];
                              String email = jsonMap['Email'];
                              String phoneNumber = jsonMap['Phone Number'];
                              String education = jsonMap['Education'];
                              List<String> skills =
                                  List<String>.from(jsonMap['Skills']);
                              List<String> experiences =
                                  List<String>.from(jsonMap['Experience']);

                              if (pickedFile != null) {
                                setState(() {
                                  // Not sure if this works
                                  _provider.setName("$firstName $lastName");
                                  _provider.setEducation(education);
                                  _provider.setSkills(skills);
                                  _provider.setExperiences(experiences);
                                  fnameController.text = firstName;
                                  lnameController.text = lastName;
                                  phoneController.text = phoneNumber;
                                  emailController.text = email;
                                  educationController.text = education;
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
                              .pushNamed(MainJobSearch.routeName);
                          uploadFiles();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: secondaryDarkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: Size(280, 56),
                        ),
                        child: Text(
                          'Start Applying For Jobs',
                          style: TextStyle(
                            color: backgroundWhite,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 60),
            child: GestureDetector(
              onTap: () async {
                pickImage();
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
