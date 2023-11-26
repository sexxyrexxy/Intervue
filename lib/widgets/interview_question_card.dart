import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';

import '../providers/position_provider.dart';

class InterviewQuestionCard extends StatelessWidget {
  String position;
  String text;

  InterviewQuestionCard(this.position, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
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
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text(
                            'Are you sure you want to delete this question?'),
                        actions: [
                          TextButton(
                            child: const Text('Confirm'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              var positionProvider =
                                  Provider.of<PositionProvider>(context,
                                      listen: false);
                              positionProvider.removeQuestions(position, text);
                            },
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'))
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.cancel))
          ],
        ));
  }
}
