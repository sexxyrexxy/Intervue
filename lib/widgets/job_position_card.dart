import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/screens/new_job_screen_I.dart';

import '../screens/candidates_upload_cv_screen.dart';

class jobPositionCard extends StatefulWidget {
  String job_title;
  String description;

  jobPositionCard(
      {required this.job_title, required this.description, super.key});

  @override
  State<jobPositionCard> createState() => _jobPositionCardState();
}

class _jobPositionCardState extends State<jobPositionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 366,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.job_title,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color(0xFF0D4073),
              fontSize: 20,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
