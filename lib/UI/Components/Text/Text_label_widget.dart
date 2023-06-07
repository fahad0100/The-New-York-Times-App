import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLabelWidget extends StatelessWidget {
  const TextLabelWidget({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w300,
    this.maxLine = 5,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int maxLine;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
