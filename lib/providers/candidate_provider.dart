import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/candidates_model.dart';

import '../auth.dart';

class CandidatesProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<String> candidatesIdList = [];
  List<CandidateModel> loadedCandidateLists = [];
  CandidateModel candidateProviderData = CandidateModel(
      id: "",
      name: "",
      email: "",
      education: "",
      appliedPosition: "",
      imgs: imgExtractedModel(imgName: "", imgUrl: ""),
      skills: [],
      experiences: [],
      question: [
        questionResponseModel(question: 'question', response: 'response')
            .toMap()
      ],
      pdfs: pdfExtractedModel(pdfName: "", pdfUrl: ""));

  CandidateModel defaultCandidate = CandidateModel(
      id: "0",
      name: "Rex Lim",
      email: "rexlim2003@gmail.com",
      education: "Bachelor of Computer Science",
      appliedPosition: "Software Engineer",
      imgs: imgExtractedModel(imgName: "", imgUrl: ""),
      skills: ["Flutter, React.JS, Python"],
      experiences: [
        "7 years of working experience",
        "Worked with AirAsia, Uber and Amazon",
        "Working with large language model and artificial intelligence",
        "Degree from Taylor's University"
      ],
      question: [
        {"What are you?": "I am Rex"},
        {"Where are you?": "Here"}
      ],
      pdfs: pdfExtractedModel(pdfName: "", pdfUrl: ""));

  Future<void> setName(String name) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({
      "name": name,
    });
    print("name updated successfully");
  }

  Future<void> setSkills(List<String> skills) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({"skills": FieldValue.arrayUnion(skills)});
    print("Skills updated successfully");
  }

  Future<void> setExperiences(List<String> experience) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({"experiences": FieldValue.arrayUnion(experience)});
    print("Experiences updated successfully");
  }

  Future<void> setEducation(String educations) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({"education": educations});
    print("Education updated successfully");
  }

  // pdfName, String pdfUrls, String candidateName, List<String> skills, List<String> experience, List<String> education
  Future<void> setPdfDetails(pdfExtractedModel pdfExtractedData) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({
      "pdfs": {
        "pdfName": pdfExtractedData.pdfName,
        "pdfUrls": pdfExtractedData.pdfUrl,
      }
    });
  }

  // Updating the questions
  Future<void> updateQuestions(String question, String answer) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({
      'questions': {'question': question, 'response': answer}
    });
  }

  Future<void> setImgDetails(imgExtractedModel imgExtractedData) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({
      "imgs": {
        "imgName": imgExtractedData.imgName,
        "imgUrls": imgExtractedData.imgUrl,
      }
    });
  }

  Future<void> setSelectedPosition(String selectedPosition) async {
    await _firebaseFirestore
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .update({"appliedPosition": selectedPosition});

    print("Selected Positions Updated");
  }

  Future<void> fetchForumId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection("candidates").get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (candidates) {
              candidatesIdList.add(candidates.reference.id);
            },
          );
        },
      );
      print('Success! fetched candidatesId List: ${candidatesIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllCandidates() async {
    for (int i = 0; i < candidatesIdList.length; i++) {
      await fetchCandidateDatabyId(candidatesIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchCandidateData() async {
    List<String> tmpSkills = <String>[];
    List<String> tmpExperiences = <String>[];
    List<Map<String, String>> tmpQuestions = <Map<String, String>>[];

    await FirebaseFirestore.instance
        .collection("candidates")
        .doc(Auth().currentUser!.uid)
        .get()
        .then((snapshot) {
      List.from(snapshot.data()!['skills']).forEach(
        (skills) {
          String data = skills;
          tmpSkills.add(data);
        },
      );
      List.from(snapshot.data()!['experiences']).forEach(
        (exp) {
          String data = exp;
          tmpExperiences.add(data);
        },
      );
      // List.from(snapshot.data()!['questions']).forEach(
      //   (questions) {
      //     String data = questions;
      //     tmpQuestions.add(data);
      //   },
      // );
      candidateProviderData.id = snapshot.data()!["id"];
      candidateProviderData.name = snapshot.data()!["name"];
      candidateProviderData.email = snapshot.data()!["email"];
      candidateProviderData.education = snapshot.data()!["education"];
      candidateProviderData.appliedPosition =
          snapshot.data()!["appliedPosition"];
      candidateProviderData.imgs = imgExtractedModel(
          imgName: snapshot.data()!["imgs"]["imgName"],
          imgUrl: snapshot.data()!["imgs"]["imgUrls"]);
      candidateProviderData.skills = tmpSkills;
      candidateProviderData.experiences = tmpExperiences;
      candidateProviderData.question = tmpQuestions;
      candidateProviderData.pdfs = pdfExtractedModel(
          pdfName: snapshot.data()!["pdfs"]["pdfName"],
          pdfUrl: snapshot.data()!["pdfs"]["pdfUrls"]);
    });
  }

  Future<void> fetchCandidateDatabyId(String candidatesId) async {
    List<String> tmpSkills = <String>[];
    List<String> tmpExperiences = <String>[];
    List<Map<String, String>> tmpQuestions = <Map<String, String>>[];

    await FirebaseFirestore.instance
        .collection("candidates")
        .doc(candidatesId)
        .get()
        .then((snapshot) {
      List.from(snapshot.data()!['skills']).forEach(
        (skills) {
          String data = skills;
          tmpSkills.add(data);
        },
      );
      List.from(snapshot.data()!['experiences']).forEach(
        (exp) {
          String data = exp;
          tmpExperiences.add(data);
        },
      );
      // List.from(snapshot.data()!['questions']).forEach(
      //   (questions) {
      //     String data = questions;
      //     tmpQuestions.add(data);
      //   },
      // );

      CandidateModel loadedCandidate = CandidateModel(
          id: snapshot.data()!["id"],
          name: snapshot.data()!["name"],
          email: snapshot.data()!["email"],
          education: snapshot.data()!["education"],
          appliedPosition: snapshot.data()!["appliedPosition"],
          imgs: imgExtractedModel(
              imgName: snapshot.data()!["imgs"]["imgName"],
              imgUrl: snapshot.data()!["imgs"]["imgUrls"]),
          skills: tmpSkills,
          experiences: tmpExperiences,
          question: tmpQuestions,
          pdfs: pdfExtractedModel(
              pdfName: snapshot.data()!["pdfs"]["pdfName"],
              pdfUrl: snapshot.data()!["pdfs"]["pdfUrls"]));

      loadedCandidateLists.add(loadedCandidate);
      print('fetched ${snapshot.data()!['name']}');
    });
  }
}
