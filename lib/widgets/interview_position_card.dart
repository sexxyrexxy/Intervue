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
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _numOfPeopleController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  final TextEditingController _responsibilitiesController =
      TextEditingController();
  final TextEditingController _benefitsController = TextEditingController();
  final TextEditingController _yearsExperienceController =
      TextEditingController();

  List<Widget> questions = [];
  @override
  Widget build(BuildContext context) {
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    int positionIndex = positionProvider.loadedPositionList
        .indexWhere((pos) => pos.name == widget.position);
    PositionModel fetchedPosition =
        positionProvider.loadedPositionList[positionIndex];
    List<String> questionList = fetchedPosition.questions;
    questions = questionList
        .map((question) => InterviewQuestionCard(widget.position, question))
        .toList();
    return ExpansionTile(
      title: Text(
        widget.position,
        style: const TextStyle(
            color: secondaryDarkBlue,
            fontSize: 17,
            fontWeight: FontWeight.w500),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Brief Description:'),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  hintText: fetchedPosition.description,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
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
                      controller: _numOfPeopleController,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Location:",
                      data: fetchedPosition.location,
                      controller: _locationController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Skills Required: ",
                      data: fetchedPosition.skillsRequired[0],
                      controller: _skillsController,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Responsibilities:",
                      data: fetchedPosition.responsibilities[0],
                      controller: _responsibilitiesController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Years of Experience:",
                      data: fetchedPosition.yearOfExperience.toString(),
                      controller: _yearsExperienceController,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: QuestionDataTextField(
                      title: "Benefits:",
                      data: fetchedPosition.benefits[0],
                      controller: _benefitsController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Questions:'),
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
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.all(10),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _questionController,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  setState(() {
                    positionProvider.addQuestion(
                        widget.position, _questionController.text, null);
                    questions.add(InterviewQuestionCard(
                        widget.position, _questionController.text));
                    _questionController.clear();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Add Question...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class QuestionDataTextField extends StatelessWidget {
  String title;
  String data;
  TextEditingController controller;

  QuestionDataTextField(
      {required this.title, required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 4,
        ),
        Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 60,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: data,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
              ),
            )),
      ],
    );
  }
}
