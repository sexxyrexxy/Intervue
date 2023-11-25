import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talentsync/models/candidates_model.dart';

import '../auth.dart';

class Candidates with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Candidates() {
    late pdfExtractedModel pdfExtractedData;
    late imgExtractedModel imgExtractedData;
    // Initialize pdfExtractedData and candidateProviderData in the constructor.
    pdfExtractedData = pdfExtractedModel(
      pdfName: '',
      pdfUrl: '',
      candidateName: '',
      skills: [],
      experiences: [],
      education: [],
    );
    imgExtractedData = imgExtractedModel(
      imgName: '',
      imgUrl: '',
    );
    CandidateModel candidateProviderData = CandidateModel(
        id: '',
        name: '',
        email: '',
        education: '',
        imgs: [],
        skills: [],
        experiences: [],
        pdfs: [pdfExtractedData]);

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

    // pdfName, String pdfUrls, String candidateName, List<String> skills, List<String> experience, List<String> education
    Future<void> setImageDetails(pdfExtractedModel pdfExtractedData) async {
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

    Future<void> setImgDetails(imgExtractedModel imgExtractedData) async {
      await _firebaseFirestore
          .collection("user")
          .doc(Auth().currentUser!.uid)
          .update({
        "imgs": {
          "imgName": imgExtractedData.imgName,
          "imgUrls": imgExtractedData.imgUrl,
        }
      });
    }
  }
}
