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
      padding: EdgeInsets.all(16),
      width: 366,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.job_title,
            style: TextStyle(
              color: Color(0xFF0D4073),
              fontSize: 20,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            widget.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
