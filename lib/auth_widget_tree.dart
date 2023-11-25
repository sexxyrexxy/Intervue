import 'package:flutter/material.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'auth.dart';
import 'navigation.dart';

class AuthWidgetTree extends StatefulWidget {
  const AuthWidgetTree({super.key});

  @override
  State<AuthWidgetTree> createState() => _AuthWidgetTreeState();
}

class _AuthWidgetTreeState extends State<AuthWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('navigation');
          return MainJobSearch();
        } else {
          print('welcome');
          return MainJobSearch();
        }
      },
    );
  }
}
