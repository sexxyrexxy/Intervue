import 'package:flutter/material.dart';
import 'package:talentsync/models/position_model.dart';

class PositionProvider with ChangeNotifier {
  List<PositionModel> positionList = [];

  void initializePositions() {
    // Job 1
    positionList.add(PositionModel(
      id: "1",
      name: "Software Engineer",
      description:
          "As a Software Engineer, you will play a pivotal role in the development and maintenance of cutting-edge software applications. Working in City A, you will collaborate with a dynamic team to deliver high-quality code, address bugs, and contribute to the overall success of our projects. With a focus on innovation, the ideal candidate possesses a minimum of 3 years of experience and excels in Java, JavaScript, and problem-solving. In addition to a stimulating work environment, we offer health insurance and flexible work hours to support your work-life balance.",
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
      description:
          "Join us as a Marketing Specialist in City B, where you will be responsible for creating and executing innovative marketing strategies. With a focus on market analysis, campaign planning, and social media management, you will contribute to the growth of our brand. The ideal candidate for this role has at least 2 years of experience and excels in digital marketing, communication skills, and creativity. Enjoy dental coverage and paid time off as part of our comprehensive benefits package.",
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
      description:
          "As a Financial Analyst based in City C, you will play a critical role in analyzing financial data and providing strategic insights. Responsibilities include financial reporting, budget analysis, and forecasting to ensure sound financial decision-making. With a minimum of 4 years of experience, the ideal candidate possesses expertise in financial modeling, Excel proficiency, and meticulous attention to detail. Our benefits package includes a 401(k) plan and remote work options, offering a well-rounded work experience.",
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
