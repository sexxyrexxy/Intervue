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
        // ignore: prefer_const_constructors
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Job details",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Responsibilities:",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "• Maintain good relationship with existing customer",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• Response to customer's enquiries",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• Follow up with the customers",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(children: [
                  Text(
                    "Job Type: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Full-time",
                    style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 20,
                    ),
                  )
                ]),
                Row(children: [
                  Text(
                    "Salary: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "RM1,800.00 - RM2,500.00 per month",
                    style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 20,
                    ),
                  )
                ]),
                Text(
                  "Benefits: ",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "• Maternity leave",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Education: ",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "• STM/SPM (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• STM/SPM (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• STM/SPM (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• STM/SPM (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Experience: ",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "• 1 - 2 year of experience (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Language: ",
                  style: TextStyle(
                      color: custom_color.secondaryDarkBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "• English (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "• Bahasa (Preferred)",
                  style: TextStyle(
                    color: custom_color.secondaryDarkBlue,
                    fontSize: 20,
                  ),
                ),
              ]),
        )
      ]),
    );
  }
}
