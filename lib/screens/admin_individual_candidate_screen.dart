import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/screens/loading_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/position_provider.dart';

class AdminIndividualCandidateScreen extends StatefulWidget {
  AdminIndividualCandidateScreen({super.key});
  static const routeName = '/individualCandidate';

  @override
  State<AdminIndividualCandidateScreen> createState() =>
      _AdminIndividualCandidateScreenState();
}

List<Widget> questions = [];

class _AdminIndividualCandidateScreenState
    extends State<AdminIndividualCandidateScreen> {
  @override
  Widget build(BuildContext context) {
    var candidateProvider =
        Provider.of<CandidatesProvider>(context, listen: false);
    CandidateModel displayedCandidate =
        ModalRoute.of(context)!.settings.arguments as CandidateModel;

    questions =
        candidateProvider.candidateProviderData.question.map((question) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.voice_chat,
              color: secondaryDarkBlue,
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _dialogBuilder(context, displayedCandidate.question);
                // _dialogBuilder(context, question.keys.toString(),
                //     question.values.toString());
              },
              child: new Text(
                displayedCandidate.question[0]['question'].toString(),
                style: TextStyle(color: secondaryDarkBlue),
              ),
            )
          ],
        ),
      );
    }).toList();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.5),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 500,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: backgroundWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Meet the candidate',
                    style: TextStyle(fontSize: 30, color: black),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 140,
                    width: 140,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(displayedCandidate.imgs.imgUrl),
                    // child: Image.asset(
                    //     fit: BoxFit.fill, 'lib/assets/images/RexLim.jpeg'),
                  ),
                  Text(
                    displayedCandidate.name,
                    style: TextStyle(color: black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Digital Marketing Manager',
                    style:
                        TextStyle(color: black.withOpacity(0.5), fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 20,
                      ),
                      Text(displayedCandidate.email)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 20,
                      ),
                      Text('014 759 3534')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.school),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Bachelor of Computer Science')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_history),
                      SizedBox(
                        width: 20,
                      ),
                      Text('7 years of experience')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_file, color: Color(0xff2200CC)),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () => launch(displayedCandidate.pdfs.pdfUrl),
                        child: Text(
                          displayedCandidate.pdfs.pdfName,
                          style: TextStyle(
                              color: Color(0xff2200CC),
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        color: secondaryDarkBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Next Step',
                      style: TextStyle(color: backgroundWhite, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hear the highlights',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ...questions,
                      Divider(
                        color: secondaryDarkBlue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'About ${displayedCandidate.name}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("General Overview: ",
                          style: TextStyle(fontSize: 20)),
                      BulletedList(
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: secondaryDarkBlue),
                          bulletColor: secondaryDarkBlue,
                          listItems: [
                            displayedCandidate.education,
                          ]),
                      Text(
                        "Skills:",
                        style: TextStyle(fontSize: 20),
                      ),
                      BulletedList(
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: secondaryDarkBlue),
                          bulletColor: secondaryDarkBlue,
                          listItems: [
                            ...displayedCandidate.skills
                                .map((skill) => '$skill'),
                          ]),
                      Text(
                        "Experience: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      BulletedList(
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: secondaryDarkBlue),
                          bulletColor: secondaryDarkBlue,
                          listItems: [
                            ...displayedCandidate.experiences
                                .map((experiences) => '$experiences'),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'This candidate is highly confident, and more elaborative in his answers than most candidates. Skillsets match the job descriptions. Highly recommended!',
                        style: TextStyle(
                            color: secondaryDarkBlue,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, List<Map<String, String>> listOfQuestionsAnswers) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        for (int i = 0; i < listOfQuestionsAnswers.length; i++) {
          String question = listOfQuestionsAnswers[i]['question'] ?? '';
          String response = listOfQuestionsAnswers[i]['response'] ?? '';
          return AlertDialog(
            title: Text(question),
            content: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(response)),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }

        // Return an empty widget here to satisfy the potentially non-nullable return type
        return const SizedBox.shrink();
      },
    );
  }
}
