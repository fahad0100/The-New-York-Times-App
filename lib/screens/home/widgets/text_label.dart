import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  const TextLabel(
      {super.key,
      required this.title,
      this.color,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 14,
      this.maxLines = 2});
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
