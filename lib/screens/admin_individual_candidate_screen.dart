import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';
import 'package:bulleted_list/bulleted_list.dart';
import '../providers/position_provider.dart';

class AdminIndividualCandidateScreen extends StatefulWidget {
  AdminIndividualCandidateScreen({super.key});
  static const routeName = '/individualCandidate';

  @override
  State<AdminIndividualCandidateScreen> createState() =>
      _AdminIndividualCandidateScreenState();
}

var questions = [];

class _AdminIndividualCandidateScreenState
    extends State<AdminIndividualCandidateScreen> {
  @override
  Widget build(BuildContext context) {
    var positionProvider =
        Provider.of<PositionProvider>(context, listen: false);

    if (questions.isEmpty) {
      positionProvider.initializePositions();
    }
    questions =
        positionProvider.positionList['Software Engineer']!.map((question) {
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
                  _dialogBuilder(context, question);
                },
                child: new Text(
                  question,
                  style: TextStyle(color: secondaryDarkBlue),
                ),
              )
            ],
          ));
    }).toList();

    questions.insert(
        1,
        Container(
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
                    _dialogBuilder(context,
                        'Could you tell me a bit more about the strategies you use to reduce load time?');
                  },
                  child: new Text(
                    'Could you tell me a bit more about the strategies you use to reduce load time?',
                    style: TextStyle(color: secondaryDarkBlue),
                  ),
                )
              ],
            )));
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
                    child: Image.asset(
                        fit: BoxFit.fill, 'lib/assets/images/RexLim.jpeg'),
                  ),
                  Text(
                    'Rex Lim',
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
                      Text('rexlim2003@gmail.com')
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
                      Text(
                        'RexCV.pdf',
                        style: TextStyle(
                            color: Color(0xff2200CC),
                            decoration: TextDecoration.underline),
                      ),
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
                        'About Rex Lim',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BulletedList(
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: secondaryDarkBlue),
                          bulletColor: secondaryDarkBlue,
                          listItems: [
                            'Software Engineer, Data Scientist, AI Engineer',
                            'Flutter, React.JS, Python',
                            '7 years of working experience',
                            'Worked with AirAsia, Uber and Amazon',
                            'Working with large language model and artificial intelligence',
                            "Degree from Taylor's University",
                            "Compensation : 100k USD",
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

  Future<void> _dialogBuilder(BuildContext context, String question) {
    String answer;
    if (question == 'Tell me a little bit about yourself') {
      answer =
          'Hi, I am a software engineer working with Netflix. my main job role includes reducing load time when users enter the website.';
    } else if (question == 'Give me two of your strengths') {
      answer =
          'Two of my strengths are my problem-solving skills and my ability to learn quickly. I am also a creative thinker and I am always looking for new ways to improve the way things are done.';
    } else if (question ==
        'Could you tell me a bit more about the strategies you use to reduce load time?') {
      answer =
          "I used a Content Delivery Network, which is a network of servers that are distributed around the world. By using a CDN, your website's content can be served to users from the server that is closest to them, reducing load times.";
    } else if (question == 'Why do you want to join us?') {
      answer =
          'I am interested in joining your team because I am impressed with your company\'s culture and your commitment to innovation. I believe that my skills and experience would be a valuable asset to your team. I am also excited about the opportunity to learn from your team and to contribute to your company\'s success.';
    } else {
      answer = 'A dialog is a type of modal window that\n'
          'appears in front of app content to\n'
          'provide critical information, or prompt\n'
          'for a decision to be made.';
    }
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(question),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(answer),
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
