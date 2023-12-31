import 'package:flutter/material.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/screens/admin_individual_candidate_screen.dart';

class CandidateCard extends StatelessWidget {
  String imagePath;
  String name;
  // CandidateModel pickedCandidate;
  CandidateCard(this.name, this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(fit: BoxFit.cover, imagePath),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 90,
                width: double.infinity,
                color: secondaryBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: backgroundWhite),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Student',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.withOpacity(0.8)),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
