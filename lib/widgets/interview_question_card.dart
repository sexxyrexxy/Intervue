import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';

class InterviewQuestionCard extends StatelessWidget {
  String text;

  InterviewQuestionCard(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: secondaryDarkBlue),
            ),
            Icon(Icons.cancel)
          ],
        ));
  }
}
