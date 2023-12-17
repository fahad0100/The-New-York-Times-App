import 'package:assessment2023/main.dart';
import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';

class WrapDesFacetWidget extends StatelessWidget {
  const WrapDesFacetWidget({super.key, required this.desFacet});
  final List desFacet;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 5,
        runSpacing: 6,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        clipBehavior: Clip.antiAlias,
        children: [
          ...desFacet.map(
            (e) => Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: context.getWidth() * 0.030,
              child: TextLabel(
                title: e,
                fontWeight: FontWeight.normal,
                color: !getIt.get<ThemeHelper>().isDark
                    ? Colors.black
                    : Colors.white,
                fontSize: context.getWidth() * 0.020,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
