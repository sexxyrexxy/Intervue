import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  double width;
  double height;
  double fontSize;
  Color color;
  IconData icons;
  String text;
  SmallButton(
      this.width, this.height, this.color, this.icons, this.text, this.fontSize,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: fontSize, color: Colors.white)),
          Icon(
            icons,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class SmallButtonWithoutIcons extends StatelessWidget {
  double width;
  double height;
  double fontSize;
  Color color;
  Color fontColor;

  String text;
  SmallButtonWithoutIcons(this.width, this.height, this.color, this.text,
      this.fontSize, this.fontColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(fontSize: fontSize, color: fontColor))),
    );
  }
}
