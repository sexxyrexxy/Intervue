import 'package:flutter/material.dart';
import 'package:talentsync/models/position_model.dart';

class PositionProvider with ChangeNotifier {
  List<PositionModel> positionList = [];

  void initializePositions() {
    // Job 1
    positionList.add(PositionModel(
      id: "1",
      name: "Software Engineer",
      description: "Develop and maintain software applications.",
      numOfPeople: 5,
      location: "City A",
      yearOfExperience: 3,
      responsibilities: [
        "Code development",
        "Bug fixing",
        "Collaborate with team"
      ],
      benefits: ["Health insurance", "Flexible work hours"],
      skillsRequired: ["Java", "JavaScript", "Problem-solving"],
    ));

    // Job 2
    positionList.add(PositionModel(
      id: "2",
      name: "Marketing Specialist",
      description: "Create and execute marketing strategies.",
      numOfPeople: 2,
      location: "City B",
      yearOfExperience: 2,
      responsibilities: [
        "Market analysis",
        "Campaign planning",
        "Social media management"
      ],
      benefits: ["Dental coverage", "Paid time off"],
      skillsRequired: [
        "Digital marketing",
        "Communication skills",
        "Creativity"
      ],
    ));

    // Job 3
    positionList.add(PositionModel(
      id: "3",
      name: "Financial Analyst",
      description: "Analyze financial data and provide insights.",
      numOfPeople: 3,
      location: "City C",
      yearOfExperience: 4,
      responsibilities: [
        "Financial reporting",
        "Budget analysis",
        "Forecasting"
      ],
      benefits: ["401(k) plan", "Remote work options"],
      skillsRequired: [
        "Financial modeling",
        "Excel proficiency",
        "Attention to detail"
      ],
    ));
  }

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
