import 'package:assessment2023/UI/Components/Text/Text_label_widget.dart';
import 'package:assessment2023/utils/constants/padding_constants.dart';
import 'package:assessment2023/utils/extensions/SizeScreen.dart';
import 'package:flutter/material.dart';

class FactsWidget extends StatelessWidget {
  const FactsWidget({super.key, required this.title, required this.facet});
  final String title;
  final List<String> facet;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextLabelWidget(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: context.screenWith(),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.start,
              children: facet
                  .map((item) => ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 60, minWidth: 50, maxWidth: 100),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(padding16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: TextLabelWidget(
                            text: item,
                            textAlign: TextAlign.center,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
