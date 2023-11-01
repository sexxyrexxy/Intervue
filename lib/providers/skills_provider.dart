import 'package:flutter/material.dart';
import '../models/skills_model.dart';

class SkillsProvider with ChangeNotifier {
  List<SkillsModel> _skills = [];

  List<SkillsModel> get skills => _skills;

  void addSkills(String skills) {
    _skills.add(SkillsModel(skills));
    notifyListeners();
  }
}
