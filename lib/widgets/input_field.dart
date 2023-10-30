import 'dart:html';

import 'package:flutter/material.dart';

import '../models/colors.dart';
import 'interview_question_card.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;

class inputField extends StatefulWidget {
  String text;
  final TextEditingController controller;

  inputField({required this.text, required this.controller});

  @override
  State<inputField> createState() => _inputFieldState();
}

class _inputFieldState extends State<inputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          width: 220,
          height: 34,
          child: TextField(
            cursorColor: custom_Color.primaryBlue,
            controller: widget.controller,
            decoration: InputDecoration(
              icon: Icon(Icons.search_rounded),
              hintText: "Enter ${widget.text} ",
              filled: true,
              fillColor: custom_Color.backgroundWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
