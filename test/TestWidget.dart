import 'package:assessment2023/UI/Components/TapWidgets/MenuDrop.dart';
import 'package:assessment2023/UI/Components/TapWidgets/SegmentedTap.dart';
import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test SegmentedTap widget", () {
    testWidgets(
      'SegmentedTap displays correct segments',
      (WidgetTester tester) async {
        // Build SegmentedTap with the desired selected period
        Period selectedPeriod = Period.day7;
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                SegmentedTap(
                  selected: selectedPeriod,
                  onSelectionChange: (selected) {
                    selectedPeriod = selected.first;
                  },
                ),
              ],
            ),
          ),
        ));
        expect(find.text('1 Day'), findsOneWidget);
        expect(find.text('7 Days'), findsOneWidget);
        expect(find.text('30 Days'), findsOneWidget);
        expect(find.byIcon(Icons.segment_outlined), findsOneWidget);
        await tester.tap(find.text('30 Days'));
        await tester.pump();
        expect(selectedPeriod, equals(Period.day30));
      },
    );
    //-----
    testWidgets('Test MenuDrop widget', (WidgetTester tester) async {
      String value = 'Emailed';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuDrop(
              value: value,
              onChanged: (newValue) {
                value = newValue!;
              },
            ),
          ),
        ),
      );

      //--------
      expect(find.text('Emailed'), findsOneWidget);
      await tester.tap(find.text('Emailed'));
      await tester.pump();
      await tester.tap(find.text('Viewed'));
      await tester.pump();
      expect(value, equals("Viewed"));
      //---Step 2
      expect(find.text('Emailed'), findsOneWidget);
      await tester.tap(find.text('Emailed'));
      await tester.pump();
      await tester.tap(find.text('Shared'));
      await tester.pump();
      expect(value, equals("Shared"));
    });
  });
}
