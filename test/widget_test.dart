import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guro_ai/main.dart';

void main() {
  testWidgets(
    'Guro.ai welcome screen appears',
    (tester) async {
      await tester.pumpWidget(const GuroAiApp());

      expect(find.byType(Image), findsOneWidget);

      expect(
        find.text('Learn. Practice. Improve.'),
        findsOneWidget,
      );

      expect(
        find.text('Get started'),
        findsOneWidget,
      );
    },
  );
}