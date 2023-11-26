// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/screens/login_screen.dart';
import 'package:talentsync/screens/signup_screen.dart';
import 'package:talentsync/widgets/Input_field.dart';
import 'package:talentsync/widgets/category.dart';
import 'package:talentsync/widgets/small-button.dart';

import '../widgets/job-details.dart';
import '../widgets/job_position_card.dart';

class MainJobSearch extends StatelessWidget {
  const MainJobSearch({super.key});
  static const routeName = '/mainJobSearch';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _positionController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 8, 24, 8),
                width: double.infinity,
                alignment: Alignment.topLeft,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/top_background.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.6),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/Intervue-Logo.png',
                      height: 80,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RegisterScreen.routeName),
                      child: smallButtonwithoutIcons(
                          140,
                          44,
                          custom_Color.backgroundWhite,
                          "Signup",
                          20,
                          custom_Color.primaryBlue),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(loginScreen.routeName),
                      child: smallButtonwithoutIcons(
                          140,
                          44,
                          custom_Color.secondaryBlue,
                          "Login",
                          20,
                          Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
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
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
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
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  inputField(text: 'What', controller: _positionController),
                  inputField(text: 'Where', controller: _locationController),
                  // Find Jobs Button
                  Container(
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 30),
                    width: 188,
                    height: 44,
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  category(
                      width: 121,
                      color: Colors.white,
                      jobTitle: "Senior Admin",
                      jobTitleColor: custom_Color.black),
                  category(
                      width: 121,
                      color: Colors.white,
                      jobTitle: "Data Analyst",
                      jobTitleColor: custom_Color.black),
                  category(
                      width: 121,
                      color: Colors.white,
                      jobTitle: "Pen Tester",
                      jobTitleColor: custom_Color.black),
                  category(
                    width: 200,
                    color: Colors.white,
                    jobTitle: "Chief Technology Officer",
                    jobTitleColor: custom_Color.black,
                  ),
                  category(
                    width: 160,
                    color: Colors.white,
                    jobTitle: "Senior Technician",
                    jobTitleColor: custom_Color.black,
                  ),
                  category(
                    width: 80,
                    color: custom_Color.secondaryDarkBlue,
                    jobTitle: "Intern",
                    jobTitleColor: custom_Color.backgroundWhite,
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
              Container(
                // width: double.infinity,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        jobpositionCard(
                          image: 'lib/assets/images/dummy_job_man.jpeg',
                          job_title: 'Senior Administrator',
                          description:
                              'This job requires inclusive work and effort in the office',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        jobpositionCard(
                          image: 'lib/assets/images/dummy_job_man.jpeg',
                          job_title: 'Senior Administrator',
                          description:
                              'This job requires inclusive work and effort in the office',
                        ),
                      ],
                    ),
                    JobDetailsCard(
                      jobPosition: "PEN TESTER INTERN",
                      location: "Ampang",
                      salaryStartRange: 1800,
                      salaryEndRange: 2500,
                      jobType: "Internship",
                    )
                  ],
                ),
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
