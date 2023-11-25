import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/position_provider.dart';

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
  List<Widget> questions = [];
  @override
  Widget build(BuildContext context) {
    questions.clear();
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    int positionIndex = positionProvider.positionList
        .indexWhere((pos) => pos.name == widget.position);
    List<String> questionList =
        positionProvider.positionList[positionIndex].questions;
    questions = questionList
        .map((question) => InterviewQuestionCard(widget.position, question))
        .toList();
    return ExpansionTile(
      title: Text(
        widget.position,
        style: TextStyle(
            color: secondaryDarkBlue,
            fontSize: 17,
            fontWeight: FontWeight.w500),
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
                positionProvider.addQuestion(
                    widget.position, _controller.text, null);
                questions.add(
                    InterviewQuestionCard(widget.position, _controller.text));
                _controller.clear();
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
