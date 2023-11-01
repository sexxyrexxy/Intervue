import 'package:flutter/material.dart';

class category extends StatefulWidget {
  double width;
  Color color;
  String jobTitle;
  Color jobTitleColor;
  category(
      {required this.width,
      required this.color,
      required this.jobTitle,
      required this.jobTitleColor,
      super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: 32,
      margin: EdgeInsets.only(top: 10, left: 28, right: 4),
      decoration: ShapeDecoration(
        color: widget.color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        widget.jobTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: widget.jobTitleColor,
          fontSize: 16,
          fontFamily: 'Futura',
        ),
      ),
    );
  }
}
