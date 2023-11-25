import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/candidates_model.dart';

import '../auth.dart';

class Candidates with ChangeNotifier {
  pdfExtractedModel pdfExtractedData = pdfExtractedModel(
      pdfName: '',
      pdfUrl: '',
      candidateName: '',
      skills: [],
      experiences: [],
      education: []);

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  CandidateModel candidateProviderData = CandidateModel(
      id: '',
      name: '',
      email: '',
      education: '',
      imgs: [],
      skills: [],
      experiences: [],
      pdfs: []);

  Future<void> setName(String name) async {
    await _firebaseFirestore
        .collection("user")
        .doc(Auth().currentUser!.uid)
        .update({
      "name": name,
    });
    print("name updated successfully");
  }

  Future<void> setSkills(List<String> skills) async {
    await _firebaseFirestore
        .collection("user")
        .doc(Auth().currentUser!.uid)
        .update({"skills": FieldValue.arrayUnion(skills)});
    print("Skills updated successfully");
  }

  Future<void> setExperiences(List<String> experience) async {
    await _firebaseFirestore
        .collection("user")
        .doc(Auth().currentUser!.uid)
        .update({"experience": FieldValue.arrayUnion(experience)});
    print("Experiences updated successfully");
  }

  // Remind me to update it into name, skills, experience after ocr works.
  Future<void> setPdfsDetails(
      List<String> pdfs, String pdfNames, String pdfDownloadLink) async {
    await _firebaseFirestore
        .collection("user")
        .doc(Auth().currentUser!.uid)
        .update(
      {
        "pdfs": {
          "name": pdfNames,
          "pdfUrls": pdfDownloadLink,
        }
      },
    );
    print("Experiences updated successfully");
  }

  // pdfName, String pdfUrls, String candidateName, List<String> skills, List<String> experience, List<String> education
  Future<void> setPdfsDetailss(pdfExtractedModel pdfExtractedData) async {
    await _firebaseFirestore
        .collection("user")
        .doc(Auth().currentUser!.uid)
        .update({
      "pdfs": {
        "name": pdfExtractedData.pdfName,
        "pdfUrls": pdfExtractedData.pdfUrl,
        "candidateName": pdfExtractedData.candidateName,
        "skills": pdfExtractedData.skills,
        "experience": pdfExtractedData.experiences,
        "education": pdfExtractedData.education
      }
    });
  }
}
