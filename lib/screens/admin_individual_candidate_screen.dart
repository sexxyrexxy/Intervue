import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    questions = displayedCandidate.question.mapIndexed((index, question) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.voice_chat,
              color: secondaryDarkBlue,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _dialogBuilder(
                    context, question['question']!, question['response']!);
                // _dialogBuilder(context, question.keys.toString(),
                //     question.values.toString());
              },
              child: new Text(
                displayedCandidate.question[index]['question'].toString(),
                style: const TextStyle(color: secondaryDarkBlue),
              ),
            )
          ],
        ),
      );
    }).toList();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.5),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: backgroundWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Meet the candidate',
                    style: TextStyle(fontSize: 30, color: black),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: 140,
                    width: 140,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(displayedCandidate.imgs.imgUrl),
                    // child: Image.asset(
                    //     fit: BoxFit.fill, 'lib/assets/images/RexLim.jpeg'),
                  ),
                  Text(
                    displayedCandidate.name,
                    style: const TextStyle(color: black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Digital Marketing Manager',
                    style:
                        TextStyle(color: black.withOpacity(0.5), fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(displayedCandidate.email)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.school),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          displayedCandidate.education,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.work_history),
                      SizedBox(
                        width: 20,
                      ),
                      Text('7 years of experience')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_file, color: Color(0xff2200CC)),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () => launch(displayedCandidate.pdfs.pdfUrl),
                        child: Text(
                          displayedCandidate.pdfs.pdfName,
                          style: const TextStyle(
                              color: Color(0xff2200CC),
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        color: secondaryDarkBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Next Step',
                      style: TextStyle(color: backgroundWhite, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Hear the highlights',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...questions,
                        const Divider(
                          color: secondaryDarkBlue,
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("General Overview: ",
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        BulletedList(
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: secondaryDarkBlue),
                            bulletColor: secondaryDarkBlue,
                            listItems: [
                              displayedCandidate.education,
                            ]),
                        SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Skills:",
                          style: TextStyle(fontSize: 20),
                        ),
                        BulletedList(
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: secondaryDarkBlue),
                            bulletColor: secondaryDarkBlue,
                            listItems: [
                              ...displayedCandidate.skills
                                  .map((skill) => '$skill'),
                            ]),
                        SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Experience: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BulletedList(
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: secondaryDarkBlue),
                            bulletColor: secondaryDarkBlue,
                            listItems: [
                              ...displayedCandidate.experiences
                                  .map((experiences) => '$experiences'),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, String question, String response) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(question),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(response),
          ),
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
      },
    );
  }
}
