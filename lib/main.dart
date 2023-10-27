import 'package:flutter/material.dart';
import 'package:talentsync/screens/candidates_test_mic.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';

import 'navigation.dart';
import 'screens/admin_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intervüe',
      theme: ThemeData(fontFamily: 'Futura'),
      home: CandidatesUploadCV(),
      routes: {
        AdminMainScreen.routeName: (context) => AdminMainScreen(),
      },
    );
  }
}
