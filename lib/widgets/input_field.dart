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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: 240,
          height: 44,
          child: TextField(
            cursorColor: custom_Color.primaryBlue,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 12, top: 8),
              suffixIcon: Icon(Icons.search_rounded),
              // icon: Icon(Icons.search_rounded),
              hintText: "${widget.text} ",
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
