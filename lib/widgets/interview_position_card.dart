import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/position_model.dart';
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
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    int positionIndex = positionProvider.positionList
        .indexWhere((pos) => pos.name == widget.position);
    PositionModel fetchedPosition =
        positionProvider.positionList[positionIndex];
    List<String> questionList = fetchedPosition.questions;
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
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Brief Description:'),
              SizedBox(
                height: 8,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(fetchedPosition.description))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundWhite,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Number of People:",
                      data: fetchedPosition.numOfPeople.toString(),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Location:",
                      data: fetchedPosition.location,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Skills Required: ",
                      data: fetchedPosition.skillsRequired[0],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Responsibilities:",
                      data: fetchedPosition.responsibilities[0],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Years of Experience:",
                      data: fetchedPosition.yearOfExperience.toString(),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Benefits:",
                      data: fetchedPosition.benefits[0],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Questions:'),
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
                    questions.add(InterviewQuestionCard(
                        widget.position, _controller.text));
                    _controller.clear();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Add Question...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class QuestionDataTextField extends StatelessWidget {
  String title;
  String data;

  QuestionDataTextField({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Text(data),
              Spacer(),
              Text(
                'Edit',
                style: TextStyle(
                  color: secondaryDarkBlue,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
