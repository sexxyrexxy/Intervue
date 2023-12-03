import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';

class CandidatesInfoTextField extends StatelessWidget {
  String text;
  TextEditingController _controller;
  CandidatesInfoTextField(this.text, this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 120, child: Text(text)),
        Container(
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
              )),
        )
      ],
    );
  }
}
