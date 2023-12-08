import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/auth_widget_tree.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/providers/position_provider.dart';
import 'package:talentsync/screens/candidates_answering_screen.dart';
import 'package:talentsync/screens/candidates_pre_interview.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';
import 'package:talentsync/screens/login_screen.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'package:talentsync/screens/signup_screen.dart';
import 'firebase_options.dart';

import 'navigation.dart';
import 'screens/admin_individual_candidate_screen.dart';
import 'screens/admin_main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ChangeNotifierProvider.value(value: CandidatesProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Intervüe',
          theme: ThemeData(fontFamily: "Futura"),
          home: Navigation(),
          routes: {
            AuthWidgetTree.routeName: (context) => AuthWidgetTree(),
            Navigation.routeName: (context) => Navigation(),
            AdminMainScreen.routeName: (context) => AdminMainScreen(),
            PreInterviewScreen.routeName: (context) => PreInterviewScreen(),
            MainJobSearch.routeName: (context) => MainJobSearch(),
            AdminIndividualCandidateScreen.routeName: (context) =>
                AdminIndividualCandidateScreen(),
            loginScreen.routeName: (context) => loginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            CandidatesUploadCV.routeName: (context) => CandidatesUploadCV(),
            CandidatesAnsweringScreen.routeName: (context) =>
                CandidatesAnsweringScreen(),
          }),
    );
  }
}
