import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/widgets/Input_field.dart';

import '../widgets/job_position_card.dart';

class MainJobSearch extends StatelessWidget {
  const MainJobSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerWhat = TextEditingController();
    final TextEditingController _controllerWho = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/top_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(
              'lib/assets/images/Intervue-Logo.png',
              height: 80,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 0, left: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 700,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Find Your ',
                          style: TextStyle(
                            color: custom_Color.black,
                            fontSize: 40,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Suitable ',
                          style: TextStyle(
                            color: custom_Color.secondaryDarkBlue,
                            fontSize: 40,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Job Position',
                          style: TextStyle(
                            color: custom_Color.black,
                            fontSize: 40,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 5, left: 30),
            child: Column(children: [
              SizedBox(
                width: 728,
                child: Text(
                  'Intervue present you with multiple job positions with AI-powered interview',
                  style: TextStyle(
                    color: custom_Color.black,
                    fontSize: 20,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ]),
          ),
          Row(
            children: [
              inputField(text: 'What', controller: _controllerWhat),
              inputField(text: 'Who', controller: _controllerWho),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20, left: 30, right: 20),
                width: 185,
                height: 42,
                decoration: BoxDecoration(
                  color: custom_Color.secondaryDarkBlue,
                  border: Border.all(
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8), // Border radius
                ),
                child: Text(
                  'Find Jobs',
                  style: TextStyle(
                    color: custom_Color.backgroundWhite,
                    fontSize: 20,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 121,
                height: 29,
                margin: EdgeInsets.only(top: 10, left: 30, right: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Senior Admin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 121,
                height: 29,
                margin: EdgeInsets.only(top: 10, left: 30, right: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Data Analyst',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: custom_Color.black,
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 121,
                height: 29,
                margin: EdgeInsets.only(top: 10, left: 30, right: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Pen Tester',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: custom_Color.black,
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 121,
                height: 29,
                margin: EdgeInsets.only(top: 10, left: 30, right: 20),
                decoration: ShapeDecoration(
                  color: custom_Color.secondaryDarkBlue,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Intern',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: custom_Color.backgroundWhite,
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 50,
            color: custom_Color.black,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Column(
            children: [
              Container(
                // width: double.infinity,
                padding: EdgeInsets.only(left: 30),
                child: jobpositionCard(
                  image: 'lib/assets/images/dummy_job_man.jpeg',
                  job_title: 'Senior Administrator',
                  description:
                      'This job requires inclusive work and effort in the office',
                ),
              ),
            ],
          )
          // ListView(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: [
          //     Container(
          //       // width: double.infinity,
          //       margin: EdgeInsets.only(right: 1000),
          //       child: jobpositionCard(
          //         image: 'lib/assets/images/dummy_job_man.jpeg',
          //         job_title: 'Senior Administrator',
          //         description:
          //             'This job requires inclusive work and effort in the office',
          //       ),
          //     ),
          //   ],
          // ),
        ],
      )),
    );
  }
}
