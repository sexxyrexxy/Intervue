import 'package:flutter/material.dart';
import 'package:talentsync/widgets/candidate_card.dart';

class AdminCandidatesScreen extends StatelessWidget {
  const AdminCandidatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CandidateCard('Rex Lim', 'lib/assets/images/RexLim.jpeg'),
                SizedBox(
                  width: 60,
                ),
                CandidateCard('Hans Andreanto', 'lib/assets/images/hans.jpeg'),
                SizedBox(
                  width: 60,
                ),
                CandidateCard('Ivy Chung', "lib/assets/images/ivy.jpeg"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CandidateCard('Go Yap Xuan', "lib/assets/images/bbq.jpeg"),
                SizedBox(
                  width: 60,
                ),
                CandidateCard(
                    'Bonifacio Ronald', 'lib/assets/images/ronald.jpeg'),
                SizedBox(
                  width: 60,
                ),
                CandidateCard('Cheah Zixu', 'lib/assets/images/cheah.png')
              ],
            )
          ],
        ));
  }
}
