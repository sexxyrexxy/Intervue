import 'package:flutter/material.dart';
import 'package:talentsync/models/position_model.dart';

class PositionProvider with ChangeNotifier {
  List<PositionModel> positionList = [];

  void initializePositions() {}

  void addNewPosition(PositionModel newPosition) {
    positionList.add(newPosition);
    notifyListeners();
  }

  void addQuestion(
      String posName, String question, int? preferredQuestionIndex) {
    int positionIndex = positionList.indexWhere((pos) => pos.name == posName);
    PositionModel newPositionModel = positionList[positionIndex];
    if (preferredQuestionIndex == null) {
      //no preferred index, put at the last
      newPositionModel.questions.add(question);
    } else {
      newPositionModel.questions.insert(preferredQuestionIndex, question);
    }
    positionList[positionIndex] = newPositionModel;
    notifyListeners();
  }

  void removeQuestions(String posName, String questionToRemove) {
    int positionIndex = positionList.indexWhere((pos) => pos.name == posName);
    positionList[positionIndex].questions.remove(questionToRemove);
    notifyListeners();
  }
}
