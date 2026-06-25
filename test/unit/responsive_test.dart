import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/utils/responsive.dart';

void main() {
  group('Responsive Utility', () {
    Widget buildWithWidth(double width, Widget Function(BuildContext) builder) {
      return MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Builder(builder: builder),
      );
    }

    testWidgets('isMobile returns true for small screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(500, (context) {
          expect(Responsive.isMobile(context), true);
          expect(Responsive.isTablet(context), false);
          expect(Responsive.isDesktop(context), false);
          return const SizedBox();
        }),
      );
    });

    testWidgets('isTablet returns true for medium screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(900, (context) {
          expect(Responsive.isMobile(context), false);
          expect(Responsive.isTablet(context), true);
          expect(Responsive.isDesktop(context), false);
          return const SizedBox();
        }),
      );
    });

    testWidgets('isDesktop returns true for large screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(1400, (context) {
          expect(Responsive.isMobile(context), false);
          expect(Responsive.isTablet(context), false);
          expect(Responsive.isDesktop(context), true);
          return const SizedBox();
        }),
      );
    });

    testWidgets('gridColumns returns correct columns',
        (WidgetTester tester) async {
      // Mobile
      await tester.pumpWidget(
        buildWithWidth(400, (context) {
          expect(Responsive.gridColumns(context), 1);
          return const SizedBox();
        }),
      );

      // Tablet
      await tester.pumpWidget(
        buildWithWidth(900, (context) {
          expect(Responsive.gridColumns(context), 2);
          return const SizedBox();
        }),
      );

      // Desktop
      await tester.pumpWidget(
        buildWithWidth(1400, (context) {
          expect(Responsive.gridColumns(context), 3);
          return const SizedBox();
        }),
      );
    });

    testWidgets('fontSize scales for device type',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(400, (context) {
          expect(Responsive.fontSize(context, base: 16), 16 * 0.85);
          return const SizedBox();
        }),
      );

      await tester.pumpWidget(
        buildWithWidth(900, (context) {
          expect(Responsive.fontSize(context, base: 16), 16 * 0.95);
          return const SizedBox();
        }),
      );

      await tester.pumpWidget(
        buildWithWidth(1400, (context) {
          expect(Responsive.fontSize(context, base: 16), 16.0);
          return const SizedBox();
        }),
      );
    });

    testWidgets('screenWidth returns correct value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(1024, (context) {
          expect(Responsive.screenWidth(context), 1024.0);
          return const SizedBox();
        }),
      );
    });

    testWidgets('contentWidth constrains for large screens',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(1500, (context) {
          expect(Responsive.contentWidth(context), 1300);
          return const SizedBox();
        }),
      );

      await tester.pumpWidget(
        buildWithWidth(1300, (context) {
          expect(Responsive.contentWidth(context), 1100);
          return const SizedBox();
        }),
      );
    });

    testWidgets('sectionPadding varies by device',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(400, (context) {
          final padding = Responsive.sectionPadding(context);
          expect(padding.left, 16);
          expect(padding.top, 40);
          return const SizedBox();
        }),
      );
    });

    testWidgets('getDeviceType returns correct type',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWithWidth(500, (context) {
          expect(Responsive.getDeviceType(context), DeviceType.mobile);
          return const SizedBox();
        }),
      );
    });
  });
}
