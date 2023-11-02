import 'package:flutter/material.dart';
import '../models/benefits_model.dart';

class BenefitsProvider with ChangeNotifier {
  List<BenefitsModel> _benefits = [];

  List<BenefitsModel> get benefits => _benefits;

  void addBenefits(String benefits) {
    _benefits.add(BenefitsModel(benefits));
    notifyListeners();
  }
}
