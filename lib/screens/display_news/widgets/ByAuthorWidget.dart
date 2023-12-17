import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/utils/helper/layout.dart';
import 'package:flutter/material.dart';

class ByAuthorWidget extends StatelessWidget {
  const ByAuthorWidget({super.key, required this.author});
  final String author;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)),
            child: Icon(Icons.person)),
        sizeLayout8H,
        TextLabel(
          title: author,
          fontSize: 12,
          color: Colors.grey.withOpacity(0.5),
        )
      ],
    );
  }
}
