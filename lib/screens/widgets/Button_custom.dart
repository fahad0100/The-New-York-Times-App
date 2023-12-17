import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, this.onTap, required this.title});
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff292C4A),
            fixedSize: Size(200, 45),
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            foregroundColor: Colors.white),
      ),
    );
  }
}
