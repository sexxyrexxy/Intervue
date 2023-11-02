import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';
import '../models/colors.dart' as custom_colors;

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundWhite,
      child: Center(
        child: CircularProgressIndicator(
          color: secondaryDarkBlue,
        ),
      ),
    );
  }
}
