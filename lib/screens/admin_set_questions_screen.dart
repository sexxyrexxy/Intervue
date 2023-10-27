import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/widgets/interview_question_card.dart';

class AdminSetInterviewScreen extends StatefulWidget {
  const AdminSetInterviewScreen({super.key});

  @override
  State<AdminSetInterviewScreen> createState() =>
      _AdminSetInterviewScreenState();
}

class _AdminSetInterviewScreenState extends State<AdminSetInterviewScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ExpansionTile(
              
              title: Text(
                'Software Engineer',
                style: TextStyle(color: secondaryDarkBlue),
              ),
              children: [
                InterviewQuestionCard(
                    'What programming languages do you know?'),
                InterviewQuestionCard(
                    'Have you had prior experience in being a software engineer?'),
                InterviewQuestionCard('How would you debug a bug?'),
                InterviewQuestionCard('Hello?'),
                Container(
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
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      _controller.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Add Question...',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Intern (Software Engineer)',
                  style: TextStyle(color: secondaryDarkBlue)),
              children: [
                InterviewQuestionCard(
                    'What programming languages do you know?'),
                InterviewQuestionCard(
                    'Have you had prior experience in being a software engineer?'),
                InterviewQuestionCard('How would you debug a bug?'),
                InterviewQuestionCard('Hello?'),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      _controller.clear();
                    },
                    decoration: InputDecoration(
                        hintText: 'Add Question...', border: InputBorder.none),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('UI/UX Designer',
                  style: TextStyle(color: secondaryDarkBlue)),
              children: [
                InterviewQuestionCard(
                    'What programming languages do you know?'),
                InterviewQuestionCard(
                    'Have you had prior experience in being a software engineer?'),
                InterviewQuestionCard('How would you debug a bug?'),
                InterviewQuestionCard('Hello?'),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      _controller.clear();
                    },
                    decoration: InputDecoration(
                        hintText: 'Add Question...', border: InputBorder.none),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
