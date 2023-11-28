import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_color;
import 'package:talentsync/screens/candidates_answering_screen.dart';
import 'package:talentsync/screens/candidates_pre_interview.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import '../models/position_model.dart';

class JobDetailsCard extends StatelessWidget {
  String jobPosition;
  String location;
  int salaryStartRange;
  int salaryEndRange;
  String jobType;
  PositionModel selectedPosition;

  JobDetailsCard(
      {required this.jobPosition,
      required this.location,
      required this.salaryStartRange,
      required this.salaryEndRange,
      required this.jobType,
      required this.selectedPosition,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
      width: 1000,     
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper half
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobPosition,
                style: TextStyle(
                  color: custom_color.secondaryDarkBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 12),
              Text(
                location,
                style: TextStyle(
                  color: custom_color.secondaryDarkBlue.withOpacity(0.3),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "RM $salaryStartRange - RM $salaryEndRange a month - $jobType",
                style: TextStyle(
                  color: custom_color.secondaryDarkBlue,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PreInterviewScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  primary: custom_color.secondaryDarkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(280, 48),
                ),
                child: Text(
                  'Apply Now',
                  style: TextStyle(
                    color: custom_color.backgroundWhite,
                    fontSize: 16,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          // Divider
          Divider(
            height: 50,
            color: custom_color.black,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          // Bottom Half
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Job Description",
                //   style: TextStyle(
                //     color: custom_color.secondaryDarkBlue,
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8),
                Text(
                  "Job Description",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  selectedPosition.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: custom_Color.secondaryDarkBlue),
                ),
                SizedBox(
                  height: 8,
                ),
                buildListItem(
                  "Responsibilities:",
                  selectedPosition.responsibilities,
                ),
                buildListItem("Job Type: ", [jobType]),
                buildListItem("Salary: ", [
                  "RM $salaryStartRange.00 - RM $salaryEndRange.00 per month",
                ]),
                buildListItem("Benefits: ", selectedPosition.benefits),
                // buildListItem("Education: ", [
                //   "STM/SPM (Preferred)",
                // ]),
                buildListItem("Experience: ", [
                  "${selectedPosition.yearOfExperience} year of experience (Preferred)",
                ]),
                // buildListItem("Language: ", [
                //   "English (Preferred)",
                //   "Bahasa (Preferred)",
                // ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: custom_color.secondaryDarkBlue,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BulletedList(
              bullet: Icon(
                Icons.circle_rounded,
                color: custom_Color.secondaryDarkBlue,
                size: 8,
              ),
              listItems: items,
              crossAxisAlignment: CrossAxisAlignment.start,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: custom_Color.secondaryDarkBlue),
              bulletColor: custom_Color.secondaryDarkBlue,
            )
          ],
          // children: items
          //     .map((item) => Text(
          //           "• $item",
          //           style: TextStyle(
          //               color: custom_color.secondaryDarkBlue, fontSize: 20),
          //         ))
          //     .toList(),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
