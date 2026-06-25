import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/widgets/common/feature_card.dart';

void main() {
  group('FeatureCard Widget', () {
    testWidgets('displays title and description', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FeatureCard(
              title: 'AI Chatbot',
              description: 'Get instant answers',
              icon: Icons.smart_toy,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('AI Chatbot'), findsOneWidget);
      expect(find.text('Get instant answers'), findsOneWidget);
    });

    testWidgets('displays icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FeatureCard(
              title: 'Test',
              description: 'Desc',
              icon: Icons.quiz,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.quiz), findsOneWidget);
    });

    testWidgets('renders within a Card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FeatureCard(
              title: 'Test',
              description: 'Desc',
              icon: Icons.dashboard,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
