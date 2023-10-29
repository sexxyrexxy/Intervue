import 'package:flutter/material.dart';

class PositionProvider with ChangeNotifier {
  Map<String, List<String>> positionList = {};
  //List<PositionModel> positionList = []; //software engineer, etc
  List<String> generalQues = [
    'Tell me a little bit about yourself',
    'Give me two of your strengths',
    'Why do you want to join us?'
  ];
  void initializePositions() {
    positionList['Software Engineer'] = [...generalQues];
    positionList['Intern'] = [...generalQues];
    positionList['UI/UX Designer'] = [...generalQues];
  }

  void addNewPosition(String newPosition) {
    positionList[newPosition] = [];
    notifyListeners();
  }

  void addQuestions(String posName, String question) {
    positionList[posName]!.add(question);
    notifyListeners();
    
  }
  void addQuestionsAtIndex(String posName, String question) {
    positionList[posName]!.insert(1,question);
    notifyListeners();
  }

  void removeQuestions(String posName, String questionToRemove) {
    if (positionList.containsKey(posName)) {
      if (positionList[posName]!.contains(questionToRemove)) {
        positionList[posName]!.remove(questionToRemove);
        notifyListeners();
      }
    }
  }
}
