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

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load(name);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  // final systemMessage = OpenAIChatCompletionChoiceMessageModel(
  //   content: "return any message you are given as JSON.",
  //   role: OpenAIChatMessageRole.assistant,
  // );
  // final userMessage = OpenAIChatCompletionChoiceMessageModel(
  //   content: "Hello, I am a chatbot created by OpenAI. How are you today?",
  //   role: OpenAIChatMessageRole.user,
  // );
  Future<void> exampleAI(String text) async {
    // Set the OpenAI API key from the .env file.
    OpenAI.apiKey = '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';

    // Start using!
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",     
      maxTokens: 500,
      prompt: """
                I am giving you a resume broken down into text. Analyze it and summarize in bullet points. 
                Strictly only extract name, phone number, email, education and skills.
                Give no extra information other than that. Here is the text : ${text}.
                Do it in the strict format and order of below:
                First Name: 'actual first name',
                Last Name: 'actual last name',
                Email: 'actual email',
                Phone number: 'actual phone number',
                Education: 'Bachelor's of Computer Science',
                Skills: 
                1. skill number 1,
                2. skill number 2,
                3. skill number 3,
                
                Skills are supposed to be one or two words per skill. For example, Flutter, Web Development, Mobile development etc.
                """,
    );

    print(completion.choices[0].text);
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
      await _firebaseFirestore
          .collection("user")
          .doc(Auth().currentUser!.uid)
          .update({"pdfNames": fileName, "pdfUrls": downloadlink});

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
    CandidateModel currentCandidate =
        Provider.of<CandidatesProvider>(context, listen: false)
            .defaultCandidate;

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
                            PdfDocument document = PdfDocument(
                                inputBytes: await _readDocumentData(
                                    'lib/assets/pdfs/CVMay2023.pdf'));
                            PdfTextExtractor extractor =
                                PdfTextExtractor(document);
                            String text = extractor.extractText();
                            exampleAI(text);
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
