// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_flutter/main.dart';

void main() {
  testWidgets('Login opens the event explorer', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('EventPass'), findsOneWidget);
    await tester.enterText(find.byType(TextField).at(0), 'user@event.com');
    await tester.enterText(find.byType(TextField).at(1), 'mobile123');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Jelajahi event'), findsOneWidget);
    expect(find.text('8 acara'), findsOneWidget);
  });
}
