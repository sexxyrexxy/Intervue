import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/screens/new_job_screen_I.dart';

import '../screens/candidates_upload_cv_screen.dart';

class jobpositionCard extends StatefulWidget {
  String job_title;
  String description;

  jobpositionCard(
      {required this.job_title, required this.description, super.key});

  @override
  State<jobpositionCard> createState() => _jobpositionCardState();
}

class _jobpositionCardState extends State<jobpositionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 366,
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.job_title,
            style: TextStyle(
              color: Color(0xFF0D4073),
              fontSize: 28,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            widget.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CandidatesUploadCV.routeName);
                },
                style: ElevatedButton.styleFrom(
                  primary: custom_Color.secondaryDarkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(340, 48),
                ),
                child: Text(
                  'Apply Now',
                  style: TextStyle(
                    color: custom_Color.backgroundWhite,
                    fontSize: 20,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
