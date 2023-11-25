import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/providers/position_provider.dart';
import 'package:talentsync/widgets/answering_screen.dart';
import 'package:talentsync/widgets/camera.dart';

class CandidatesAnsweringScreen extends StatefulWidget {
  static const routeName = '/autoanswer';
  const CandidatesAnsweringScreen({super.key});

  @override
  State<CandidatesAnsweringScreen> createState() =>
      _CandidatesAnsweringScreenState();
}

class _CandidatesAnsweringScreenState extends State<CandidatesAnsweringScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<AnsweringScreen> questions = [];
  final PageController _pageController = PageController();
  int currentPage = 0;

  void action() {
    currentPage++;
    _pageController.animateToPage(currentPage,
        duration: new Duration(seconds: 1), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    var candidateProvider =
        Provider.of<CandidatesProvider>(context, listen: true);
    questions = candidateProvider.defaultCandidate.question
        .map(
          (question) => AnsweringScreen(question.keys.toString(), action),
        )
        .toList();
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        width: double.infinity,
        height: 800,
        child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [...questions]),
      ),
    ));
  }
}
