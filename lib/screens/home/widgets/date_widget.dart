import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key, required this.title, required this.date});
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: context.getWidth() * 0.020,
          ),
        ),
        Text(
          date,
          style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: context.getWidth() * 0.020,
          ),
        ),
      ],
    );
  }
}
