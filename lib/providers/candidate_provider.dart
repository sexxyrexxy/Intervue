import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/candidates_model.dart';

import '../auth.dart';

class CandidatesProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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
        .update({"experience": FieldValue.arrayUnion(experience)});
    print("Experiences updated successfully");
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
}
