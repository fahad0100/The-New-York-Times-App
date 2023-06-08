import 'package:assessment2023/UI/components/Text/Text_label_widget.dart';
import 'package:assessment2023/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class MenuDrop extends StatelessWidget {
  const MenuDrop({super.key, required this.value, this.onChanged});

  final String value;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: padding24, top: padding24, right: padding24, bottom: padding8),
      child: SizedBox(
        width: 100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: DropdownButton<String>(
            // Step 3.

            focusColor: Colors.red,
            padding: EdgeInsets.only(top: 25),
            hint: TextLabelWidget(
              text: value,
              color: Colors.white,
              fontSize: 20,
            ),
            disabledHint: TextLabelWidget(
              text: value,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            iconEnabledColor: Colors.black,

            // Step 4.
            items: <String>['Emailed', 'Shared', 'Viewed']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: TextLabelWidget(text: value),
                alignment: Alignment.center,
              );
            }).toList(),
            // Step 5.
            onChanged: onChanged,
            dropdownColor: Colors.white,
            isExpanded: false,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
