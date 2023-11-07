import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';
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
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);
    if (questions.isEmpty) {
      positionProvider.initializePositions();
    }
    questions = positionProvider.positionList['Software Engineer']!
        .map(
          (question) => AnsweringScreen(question, action),
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
//  GestureDetector(
//               onTap: () {
//                 currentPage++;
//                 _pageController.animateToPage(currentPage,
//                     duration: new Duration(seconds: 1), curve: Curves.easeIn);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: secondaryDarkBlue),
//                 child: Text(
//                   'Next Question',
//                   style: TextStyle(color: backgroundWhite),
//                 ),
//               ))