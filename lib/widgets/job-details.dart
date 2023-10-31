import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_color;

class jobDetailsCard extends StatelessWidget {
  const jobDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 60, right: 60),
      width: 1000,
      height: 980,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(12),
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Upper half
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PEN TESTER INTERN",
              style: TextStyle(
                  color: custom_color.secondaryDarkBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Location",
              style: TextStyle(
                color: custom_color.secondaryDarkBlue.withOpacity(0.3),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "RM {} - RM {} a month - {jobtype}",
              style: TextStyle(
                color: custom_color.secondaryDarkBlue,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 280,
              height: 48,
              decoration: BoxDecoration(
                color: custom_color.secondaryDarkBlue,
                border: Border.all(
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
              child: Text(
                'Apply Now',
                style: TextStyle(
                  color: custom_color.backgroundWhite,
                  fontSize: 20,
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
          child: Column(children: [Text("Job detasilssss")]),
        )
      ]),
    );
  }
}
