import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';

class NotificationCard extends StatelessWidget {
  String text;

  NotificationCard(this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryDarkBlue
                ),
                child: Icon(Icons.notifications_active,color: backgroundWhite,),
              ),
              SizedBox(width: 20,),
              Text(text, style: TextStyle(color: secondaryDarkBlue,fontSize: 20),)
            ],
          ),
          SizedBox(height: 10,),
          Divider(height: 1, color: secondaryDarkBlue,)
        ],
      ),
    );
  }
}
