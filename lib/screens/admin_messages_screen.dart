import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/widgets/notification_card.dart';

class AdminMessageScreen extends StatelessWidget {
  const AdminMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Messages',
          style: TextStyle(
              color: secondaryDarkBlue,
              fontSize: 40,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 40,),
        NotificationCard('Rex Lim applied for Software Enginnering Position'),
        NotificationCard('Bonifacio Ronald applied for Software Enginnering Position'),
        NotificationCard('Cheah Zixu applied for Software Enginnering Position'),
        NotificationCard('Ivy Chung applied for Software Enginnering Position'),
      ]),
    );
  }
}
