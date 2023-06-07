import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:assessment2023/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class SegmentedTap extends StatelessWidget {
  const SegmentedTap({
    super.key,
    required this.selected,
    required this.onSelectionChange,
  });
  final Period selected;
  final Function(Set<Period>) onSelectionChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding8),
      child: SegmentedButton<Period>(
        segments: const <ButtonSegment<Period>>[
          ButtonSegment(
            value: Period.day1,
            label: Text('1 Day'),
          ),
          ButtonSegment(
            value: Period.day7,
            label: Text('7 Days'),
          ),
          ButtonSegment(
            value: Period.day30,
            label: Text('30 Days'),
          ),
        ],
        selected: {selected},
        selectedIcon: const Icon(Icons.segment_outlined),
        onSelectionChanged: onSelectionChange,
      ),
    );
  }
}
