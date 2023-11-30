import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/position_model.dart';

import '../auth.dart';

class PositionProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<String> positionIdList = [];
  List<PositionModel> loadedPositionList = [];
  String _selectedPositionId = '';

  String get selectedPositionId => _selectedPositionId;

  void setSelectedPositionId(String positionId) async {
    _selectedPositionId = positionId;
    notifyListeners();
    print(_selectedPositionId);
  }

  // void initializePositions() {
  //   // Job 1
  //   positionList.add(PositionModel(
  //     id: "1",
  //     name: "Software Engineer",
  //     description:
  //         "As a Software Engineer, you will play a pivotal role in the development and maintenance of cutting-edge software applications. Working in City A, you will collaborate with a dynamic team to deliver high-quality code, address bugs, and contribute to the overall success of our projects. With a focus on innovation, the ideal candidate possesses a minimum of 3 years of experience and excels in Java, JavaScript, and problem-solving. In addition to a stimulating work environment, we offer health insurance and flexible work hours to support your work-life balance.",
  //     numOfPeople: 5,
  //     location: "City A",
  //     yearOfExperience: 3,
  //     responsibilities: [
  //       "Code development",
  //       "Bug fixing",
  //       "Collaborate with team"
  //     ],
  //     benefits: ["Health insurance", "Flexible work hours"],
  //     skillsRequired: ["Java", "JavaScript", "Problem-solving"],
  //   ));

  //   // Job 2
  //   positionList.add(PositionModel(
  //     id: "2",
  //     name: "Marketing Specialist",
  //     description:
  //         "Join us as a Marketing Specialist in City B, where you will be responsible for creating and executing innovative marketing strategies. With a focus on market analysis, campaign planning, and social media management, you will contribute to the growth of our brand. The ideal candidate for this role has at least 2 years of experience and excels in digital marketing, communication skills, and creativity. Enjoy dental coverage and paid time off as part of our comprehensive benefits package.",
  //     numOfPeople: 2,
  //     location: "City B",
  //     yearOfExperience: 2,
  //     responsibilities: [
  //       "Market analysis",
  //       "Campaign planning",
  //       "Social media management"
  //     ],
  //     benefits: ["Dental coverage", "Paid time off"],
  //     skillsRequired: [
  //       "Digital marketing",
  //       "Communication skills",
  //       "Creativity"
  //     ],
  //   ));

  //   // Job 3
  //   positionList.add(PositionModel(
  //     id: "3",
  //     name: "Financial Analyst",
  //     description:
  //         "As a Financial Analyst based in City C, you will play a critical role in analyzing financial data and providing strategic insights. Responsibilities include financial reporting, budget analysis, and forecasting to ensure sound financial decision-making. With a minimum of 4 years of experience, the ideal candidate possesses expertise in financial modeling, Excel proficiency, and meticulous attention to detail. Our benefits package includes a 401(k) plan and remote work options, offering a well-rounded work experience.",
  //     numOfPeople: 3,
  //     location: "City C",
  //     yearOfExperience: 4,
  //     responsibilities: [
  //       "Financial reporting",
  //       "Budget analysis",
  //       "Forecasting"
  //     ],
  //     benefits: ["401(k) plan", "Remote work options"],
  //     skillsRequired: [
  //       "Financial modeling",
  //       "Excel proficiency",
  //       "Attention to detail"
  //     ],
  //   ));
  // }

  void addNewPosition(PositionModel newPosition) {
    loadedPositionList.add(newPosition);
    notifyListeners();
  }

  void addQuestion(
      String posName, String question, int? preferredQuestionIndex) {
    int positionIndex =
        loadedPositionList.indexWhere((pos) => pos.name == posName);

    PositionModel newPositionModel = loadedPositionList[positionIndex];
    if (preferredQuestionIndex == null) {
      //no preferred index, put at the last
      newPositionModel.questions.add(question);
    } else {
      newPositionModel.questions.insert(preferredQuestionIndex, question);
    }
    loadedPositionList[positionIndex] = newPositionModel;
    notifyListeners();
  }

  Future<void> removeQuestions(String posName, String questionToRemove) async {
    int positionIndex =
        loadedPositionList.indexWhere((pos) => pos.name == posName);
    loadedPositionList[positionIndex].questions.remove(questionToRemove);
    notifyListeners();
  }

  Future<void>? createNewPosition(
      String id,
      String posName,
      String description,
      int numOfPeople,
      String location,
      int yearOfExperience,
      List<String> benefits,
      List<String> skillsRequired,
      List<String> responsibilities,
      List<String> defaultQuestions) {
    _firebaseFirestore.collection("position").add({}).then(
      (value) {
        id = value.id;
        print("id: ${value.id}");
        _firebaseFirestore.collection("position").doc(id).set(
          {
            'id': id,
            'positionName': posName,
            'description': description,
            'numOfPeople': numOfPeople,
            'location': location,
            'yearOfExperience': yearOfExperience,
            'responsibilities': responsibilities,
            'benefits': benefits,
            'skillsRequired': skillsRequired,
            'defaultQuestions': defaultQuestions,
          },
        );
      },
    );
    notifyListeners();
    return null;
  }

  Future<void> fetchPositionId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('position').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (position) {
              positionIdList.add(position.reference.id);
            },
          );
        },
      );
      print('Success! fetched position List: ${[positionIdList]}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllPosition() async {
    for (int i = 0; i < positionIdList.length; i++) {
      await fetchPositionById(positionIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchPositionById(String positionId) async {
    List<String> tmpSkillsRequired = <String>[];
    List<String> tmpBenefits = <String>[];
    List<String> tmpresponsibilities = <String>[];
    List<String> tmpQuestions = <String>[];

    await FirebaseFirestore.instance
        .collection("position")
        .doc(positionId)
        .get()
        .then((snapshot) {
      List.from(snapshot.data()!['skillsRequired']).forEach(
        (skills) {
          String data = skills;
          tmpSkillsRequired.add(data);
        },
      );
      List.from(snapshot.data()!['responsibilities']).forEach(
        (exp) {
          String data = exp;
          tmpresponsibilities.add(data);
        },
      );
      List.from(snapshot.data()!['benefits']).forEach(
        (skills) {
          String data = skills;
          tmpBenefits.add(data);
        },
      );
      List.from(snapshot.data()!['defaultQuestions']).forEach(
        (exp) {
          String data = exp;
          tmpQuestions.add(data);
        },
      );

      PositionModel loadedPosition = PositionModel(
        id: snapshot.data()!["id"],
        name: snapshot.data()!["positionName"],
        description: snapshot.data()!["description"],
        numOfPeople: snapshot.data()!["numOfPeople"],
        yearOfExperience: snapshot.data()!["yearOfExperience"],
        location: snapshot.data()!["location"],
        benefits: tmpBenefits,
        responsibilities: tmpresponsibilities,
        skillsRequired: tmpSkillsRequired,
      );
      print(loadedPosition);
      loadedPositionList.add(loadedPosition);
      print('fetched ${snapshot.data()!['id']}');
      print(loadedPositionList.length);
    });
  }

  Future<void> setDescription(String id, String newDesc) async {
    await _firebaseFirestore
        .collection("position")
        .doc(id)
        .update({"description": newDesc});

    print("Selected Positions Updated");
  }

  Future<void> setnumOfpeople(String id, String newNum) async {
    await _firebaseFirestore
        .collection("position")
        .doc(id)
        .update({"numOfPeople": newNum});

    print("Selected Positions Updated");
  }

  Future<void> setYearOfExperience(String id, String newYear) async {
    await _firebaseFirestore
        .collection("position")
        .doc(id)
        .update({"numOfPeople": newYear});
    print("Selected Positions Updated");
  }

  Future<void> setResponsibility(String id, String newRes) async {
    await _firebaseFirestore
        .collection("position")
        .doc(id)
        .update({"responsibilities": newRes});
    print("Selected Positions Updated");
  }
}
