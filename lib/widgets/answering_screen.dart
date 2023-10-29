import 'package:flutter/material.dart';
import 'package:talentsync/widgets/camera.dart';

import '../models/colors.dart';

class AnsweringScreen extends StatelessWidget {
  String question;
  Function()? action;
   AnsweringScreen(this.question, this.action,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(question,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(
              height: 20,
            ),
            Camera(800, 540),
            SizedBox(height:20),
            GestureDetector(
              onTap: action,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryDarkBlue),
                child: Text(
                  'Next Question',
                  style: TextStyle(color: backgroundWhite),
                ),
              ))
          ],
        ));
  }
}
