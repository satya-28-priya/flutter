import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/main.dart';

void main() {
  testWidgets('MeritZoneApp renders successfully', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MeritZoneApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Merit Zone'), findsWidgets);
  });
}
