import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/benefits_provider.dart';
import 'package:talentsync/providers/position_provider.dart';
import 'package:talentsync/providers/responsibilities_provider.dart';
import 'package:talentsync/providers/skills_provider.dart';
import 'package:talentsync/screens/candidates_answering_screen.dart';
import 'package:talentsync/screens/candidates_pre_interview.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';
import 'package:talentsync/screens/speech_to_text.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'package:talentsync/screens/new_job_screen_I.dart';
import 'package:talentsync/screens/new_job_screen_II.dart';
import 'package:talentsync/screens/new_job_screen_III.dart';
import 'package:talentsync/screens/speech_to_text.dart';
import 'package:talentsync/widgets/camera.dart';

import 'navigation.dart';
import 'screens/admin_individual_candidate_screen.dart';
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
        ChangeNotifierProvider.value(
          value: ResponsibilitiesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BenefitsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SkillsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Intervüe',
        theme: ThemeData(fontFamily: 'Futura'),
        home: Navigation(),
        routes: {
          AdminMainScreen.routeName: (context) => AdminMainScreen(),
          newJobPostionScreenII.routeName: (context) => newJobPostionScreenII(),
          newJobPositionScreenIII.routeName: (context) =>newJobPositionScreenIII(),
          PreInterviewScreen.routeName: (context) => PreInterviewScreen(),
          MainJobSearch.routeName: (context) => MainJobSearch(),
          AdminIndividualCandidateScreen.routeName: (context) => AdminIndividualCandidateScreen()
        }
      ),
    );
  }
}
