import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/position_provider.dart';
import 'package:talentsync/screens/candidates_pre_interview.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PositionProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Intervüe',
        theme: ThemeData(fontFamily: 'Futura'),
        home: MainJobSearch(),
        routes: {
          AdminMainScreen.routeName: (context) => AdminMainScreen(),
          PreInterviewScreen.routeName: (context) => PreInterviewScreen(),
        },
      ),
    );
  }
}
