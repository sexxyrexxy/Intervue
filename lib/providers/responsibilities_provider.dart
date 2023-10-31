import 'package:flutter/material.dart';
import 'package:talentsync/models/responsibilities_model.dart';

class ResponsibilitiesProvider with ChangeNotifier {
  List<ResponsibilitiesModel> _responsibilities = [];

  List<ResponsibilitiesModel> get responsibilities => _responsibilities;

  void addResponsibilities(String responsibilities) {
    _responsibilities.add(ResponsibilitiesModel(responsibilities));
    notifyListeners();
  }
}
