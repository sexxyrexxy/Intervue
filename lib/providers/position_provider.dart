import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/position_model.dart';

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
        (resp) {
          String data = resp;
          tmpresponsibilities.add(data);
        },
      );
      List.from(snapshot.data()!['benefits']).forEach(
        (benefit) {
          String data = benefit;
          tmpBenefits.add(data);
        },
      );
      List.from(snapshot.data()!['defaultQuestions']).forEach(
        (question) {
          String data = question;
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
          questions: tmpQuestions);
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
