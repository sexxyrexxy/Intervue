import 'package:flutter/material.dart';

import '../models/colors.dart';
import 'interview_question_card.dart';

class InterviewPosition extends StatefulWidget {
  
  String position;
  InterviewPosition(this.position);
  @override
  State<InterviewPosition> createState() => _InterviewPositionState();
}

class _InterviewPositionState extends State<InterviewPosition> {
  
  final TextEditingController _controller = TextEditingController();
  List<Widget> questions = [
    InterviewQuestionCard('What programming languages do you know?'),
    InterviewQuestionCard(
        'Have you had prior experience in being a software engineer?'),
    InterviewQuestionCard('How would you debug a bug?'),
    InterviewQuestionCard('Hello?'),
  ];
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.position,
        style: TextStyle(color: secondaryDarkBlue,fontSize: 17,fontWeight: FontWeight.w500),
      ),
      children: [
        ...questions,
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
              setState(() {
                _controller.clear();
                questions.add(InterviewQuestionCard(value));
              });
            },
            decoration: InputDecoration(
              hintText: 'Add Question...',
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
