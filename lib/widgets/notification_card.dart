import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';

class NotificationCard extends StatelessWidget {
  String text;

  NotificationCard(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: secondaryDarkBlue),
                child: const Icon(
                  Icons.notifications_active,
                  color: backgroundWhite,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(color: secondaryDarkBlue, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            color: secondaryDarkBlue,
          )
        ],
      ),
    );
  }
}
