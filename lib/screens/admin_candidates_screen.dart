import 'package:flutter/material.dart';

class AdminCandidatesScreen extends StatelessWidget {
  const AdminCandidatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 60,),
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 60,),
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
                
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 60,),
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 60,),
            Container(
              height: 360,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
