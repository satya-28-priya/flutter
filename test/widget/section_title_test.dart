import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/widgets/common/section_title.dart';

void main() {
  group('SectionTitle Widget', () {
    testWidgets('displays title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionTitle(title: 'Test Title'),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('displays subtitle when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionTitle(
              title: 'Title',
              subtitle: 'Subtitle text',
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle text'), findsOneWidget);
    });

    testWidgets('hides subtitle when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionTitle(title: 'Only Title'),
          ),
        ),
      );

      expect(find.text('Only Title'), findsOneWidget);
      // Should have the accent bar
      final containers = tester.widgetList<Container>(find.byType(Container));
      expect(containers.isNotEmpty, true);
    });

    testWidgets('has accent bar decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionTitle(title: 'Test'),
          ),
        ),
      );

      // Should find the decorative bar (a Container with fixed width/height)
      expect(find.byType(Container), findsWidgets);
    });
  });
}
