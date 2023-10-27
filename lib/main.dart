import 'package:flutter/material.dart';
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
      title: 'Intervue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Intervüe',
        theme: ThemeData(fontFamily: 'Futura'),
        home: CandidatesUploadCV(),
        routes: {
          AdminMainScreen.routeName: (context) => AdminMainScreen(),
        });
  }
}
