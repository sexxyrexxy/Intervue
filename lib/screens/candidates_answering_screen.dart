import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/position_provider.dart';
import 'package:talentsync/screens/main_job_searching_screen.dart';
import 'package:talentsync/widgets/answering_screen.dart';

class CandidatesAnsweringScreen extends StatefulWidget {
  static const routeName = '/autoanswer';
  const CandidatesAnsweringScreen({super.key});

  @override
  State<CandidatesAnsweringScreen> createState() =>
      _CandidatesAnsweringScreenState();
}

int currentPage = 0;

class _CandidatesAnsweringScreenState extends State<CandidatesAnsweringScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<AnsweringScreen> questions = [];
  final PageController _pageController = PageController();

  void action() {
    if (currentPage != questions.length - 1) {
      currentPage++;

      _pageController.animateToPage(currentPage,
          duration: new Duration(seconds: 1), curve: Curves.easeIn);
    } else {
      Navigator.of(context).pushReplacementNamed(MainJobSearch.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    String jobPosition = ModalRoute.of(context)!.settings.arguments as String;
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    int positionIndex = positionProvider.loadedPositionList
        .indexWhere((pos) => pos.name == jobPosition);
    questions = positionProvider.loadedPositionList[positionIndex].questions
        .map(
          (question) => AnsweringScreen(
              position: jobPosition,
              question: question.toString(),
              action: action),
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
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [...questions]),
      ),
    ));
  }
}
