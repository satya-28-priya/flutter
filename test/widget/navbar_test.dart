import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/widgets/home/navbar.dart';

void main() {
  void setDesktopSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
  }

  group('Navbar Widget', () {
    testWidgets('displays Merit Zone logo', (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Navbar(),
          ),
        ),
      );

      expect(find.text('Merit Zone'), findsOneWidget);
      expect(find.byIcon(Icons.school), findsOneWidget);
    });

    testWidgets('shows menu items on desktop', (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Navbar(),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Courses'), findsOneWidget);
    });

    testWidgets('shows Login and Register buttons on desktop',
        (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Navbar(),
          ),
        ),
      );

      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('calls onLoginPressed when Login button tapped',
        (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      bool loginPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Navbar(
              onLoginPressed: () => loginPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Login'));
      expect(loginPressed, true);
    });

    testWidgets('calls onRegisterPressed when Register button tapped',
        (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      bool registerPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Navbar(
              onRegisterPressed: () => registerPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Register'));
      expect(registerPressed, true);
    });

    testWidgets('shows hamburger menu on mobile',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Navbar(),
          ),
        ),
      );

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('calls onMenuItemPressed when item tapped',
        (WidgetTester tester) async {
      setDesktopSize(tester);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      String? tappedItem;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Navbar(
              onMenuItemPressed: (item) => tappedItem = item,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Home'));
      expect(tappedItem, 'Home');
    });
  });
}
