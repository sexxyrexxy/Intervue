import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;

class jobpositionCard extends StatefulWidget {
  String image;
  String job_title;
  String description;
  jobpositionCard(
      {required this.image,
      required this.job_title,
      required this.description,
      super.key});

  @override
  State<jobpositionCard> createState() => _jobpositionCardState();
}

class _jobpositionCardState extends State<jobpositionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 366,
      height: 479,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(12),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 331.90,
            height: 250.05,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/dummy_job_man.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Pen-Tester Intern',
            style: TextStyle(
              color: Color(0xFF0D4073),
              fontSize: 28,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              height: 0,
            ),
          ),
          Text(
            'Intervue present you with multiple job positions with AI-powered interview',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Actor',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 323,
                height: 42,
                decoration: BoxDecoration(
                  color: custom_Color.secondaryDarkBlue,
                  border: Border.all(
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8), // Border radius
                ),
                child: Text(
                  'Apply Now',
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
        ],
      ),
    );
  }
}
