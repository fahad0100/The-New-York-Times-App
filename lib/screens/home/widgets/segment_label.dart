import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class SegmentLabel extends StatelessWidget {
  const SegmentLabel(
      {super.key, required this.currentIndex, required this.items, this.onTap});
  final int currentIndex;
  final List<String> items;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            items.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          if (onTap != null) {
                            onTap!(index);
                          }
                        },
                        child: Center(
                          child: TextLabel(
                            title: items[index],
                            fontSize: (context.getWidth(divide: 3)) * 0.1,
                            fontWeight: currentIndex == index
                                ? FontWeight.bold
                                : FontWeight.w100,
                          ),
                        ),
                      ),
                      if (currentIndex == index)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        )
                    ],
                  ),
                ))
      ],
    );
  }
}

//-----
