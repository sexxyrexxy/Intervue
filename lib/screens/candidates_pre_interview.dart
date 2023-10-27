import 'package:flutter/material.dart';
import 'package:talentsync/widgets/small-button.dart';
import 'package:talentsync/models/colors.dart' as custom_colors;

class PreInterviewScreen extends StatelessWidget {
  const PreInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 52, vertical: 36),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('lib/assets/images/intervue-logo.png', height: 80),
              smallButton(120, 40, custom_colors.secondaryDarkBlue,
                  Icons.arrow_forward_ios, "Start", 16)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 640,
                height: 320,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(28)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Interview Question \n will be shown here.',
                    style: TextStyle(
                        fontSize: 24,
                        color: custom_colors.primaryBlue,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 20,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "A few tips before proceeding:",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3), fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '•',
                        style: TextStyle(
                            fontSize: 28, color: Colors.black.withOpacity(0.3)),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Make sure that your surrounding \nenvironment is well-lit",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3), fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '•',
                        style: TextStyle(
                            fontSize: 28, color: Colors.black.withOpacity(0.3)),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Avoid rooms with noisy backgrounds",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3), fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '•',
                        style: TextStyle(
                            fontSize: 28, color: Colors.black.withOpacity(0.3)),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Make sure that your surrounding \nenvironment is well-lit",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3), fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "When you're ready, click the 'Start' \nbutton located top right",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "[Live Caption will show up when you speak]",
            style: TextStyle(fontSize: 16, color: custom_colors.primaryBlue),
          )
        ],
      ),
    );
  }
}
