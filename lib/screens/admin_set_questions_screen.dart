import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/widgets/interview_position_card.dart';
import 'package:talentsync/widgets/interview_question_card.dart';

class AdminSetInterviewScreen extends StatefulWidget {
  const AdminSetInterviewScreen({super.key});

  @override
  State<AdminSetInterviewScreen> createState() =>
      _AdminSetInterviewScreenState();
}

class _AdminSetInterviewScreenState extends State<AdminSetInterviewScreen> {
  List<Widget> positions = [
    InterviewPosition('Software Engineer'),
    InterviewPosition('System Engineer'),
    InterviewPosition('Intern (Software Engineer)'),
    InterviewPosition('UI/UX Designer'),
  ];
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interview Positions',
              style: TextStyle(
                  color: secondaryDarkBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 0,
            ),
            ...positions,
            Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    setState(() {
                      _controller.clear();
                      positions.add(InterviewPosition(value));
                    });
                  },
                  //Change this to button that leads to the job posting screen//
                  decoration: InputDecoration(
                    hintText: 'Add New Position',
                    border: InputBorder.none,
                  ),
                ))
          ],
        ));
  }
}
