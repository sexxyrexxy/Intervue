import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/providers/skills_provider.dart';

class newJobPositionScreenIII extends StatefulWidget {
  static const routeName = '/newjob3';
  const newJobPositionScreenIII({super.key});

  @override
  newJobPositionScreenIIIState createState() => newJobPositionScreenIIIState();
}

List<Widget> skills = [];
final _controllerS = TextEditingController();
final _controllerD = TextEditingController();

class newJobPositionScreenIIIState extends State<newJobPositionScreenIII> {
  @override
  Widget build(BuildContext context) {
    var skillsProvider = Provider.of<SkillsProvider>(context, listen: true);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back)),
                ),
                Text(
                  ' Add New Job Position ',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Container(
              height: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 42.0, top: 35, bottom: 5),
                      child: Text(
                        'Skills',
                        style: TextStyle(
                            color: custom_Color.secondaryDarkBlue,
                            fontSize: 25,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Material(
                      child: TextField(
                        controller: _controllerS,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          if (_controllerS.text.isNotEmpty) {
                            setState(() {
                              skillsProvider.addSkills(_controllerS.text);
                              _controllerS.clear();
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Add Skills',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: skillsProvider.skills.length,
                        itemBuilder: (context, index) {
                          var item = skillsProvider.skills[index];
                          return Material(
                            child: ListTile(
                              title: Text(item.skills),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 10),
                child: Text(
                  'Write a short decription about the job',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              Material(
                child: Container(
                  height: 195,
                  child: TextField(
                    controller: _controllerD,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      //set state//
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFFFFFFF),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: custom_Color.black.withOpacity(0.3),
                    width: 1.5,
                  )),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      child: GestureDetector(
                        onTap: () => _selectFile(context),
                        child: Container(
                          width: 450,
                          height: 250,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.cloud_upload,
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Note : Upload the photos in (png , jpg , jpeg.) format only',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //save everything//
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: custom_Color.secondaryDarkBlue,
                      padding: EdgeInsets.all(20),
                      // Set padding for the button
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: custom_Color.backgroundWhite,
                        fontSize: 20,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

Future<void> _selectFile(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    List<String> fileNames = result.paths.map((path) => path!).toList();
    // Handle the selected files (fileNames) as per your application logic
    print("Selected files: $fileNames");
  } else {
    // User canceled the file selection
  }
}
