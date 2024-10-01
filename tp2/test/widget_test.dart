import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp2/main.dart'; // Assuming this is correct for your import path

void main() {
  testWidgets('TodoApp smoke test', (WidgetTester tester) async {
    // Build the TodoApp and trigger a frame.
    await tester.pumpWidget(const TodoApp()); // Changed from MyApp to TodoApp

    // Verify that the initial UI contains no tasks.
    expect(find.text('Enter a task'), findsOneWidget);
    expect(find.text('New Task'), findsNothing);

    // Add a new task.
    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the new task is now displayed.
    expect(find.text('New Task'), findsOneWidget);
  });
}
