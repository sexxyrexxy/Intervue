import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  double width;
  Color color;
  String jobTitle;
  Color jobTitleColor;
  Category(
      {required this.width,
      required this.color,
      required this.jobTitle,
      required this.jobTitleColor,
      super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: 32,
      margin: const EdgeInsets.only(top: 10, left: 28, right: 4),
      decoration: ShapeDecoration(
        color: widget.color,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
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
