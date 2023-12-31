import 'package:flutter/material.dart';

class JobPositionCard extends StatefulWidget {
  String job_title;
  String description;

  JobPositionCard(
      {required this.job_title, required this.description, super.key});

  @override
  State<JobPositionCard> createState() => _JobPositionCardState();
}

class _JobPositionCardState extends State<JobPositionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 366,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.job_title,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Color(0xFF0D4073),
              fontSize: 20,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
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
