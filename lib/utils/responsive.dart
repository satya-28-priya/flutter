import 'package:flutter/material.dart';
import '../config/constants.dart';

enum DeviceType { mobile, tablet, desktop }

class Responsive {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < AppConstants.mobileBreakpoint) return DeviceType.mobile;
    if (width < AppConstants.desktopBreakpoint) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double contentWidth(BuildContext context) {
    final width = screenWidth(context);
    if (width > 1400) return 1300;
    if (width > 1200) return 1100;
    return width * 0.92;
  }

  static int gridColumns(BuildContext context) {
    final type = getDeviceType(context);
    switch (type) {
      case DeviceType.mobile:
        return 1;
      case DeviceType.tablet:
        return 2;
      case DeviceType.desktop:
        return 3;
    }
  }

  static double fontSize(BuildContext context, {double base = 16}) {
    final type = getDeviceType(context);
    switch (type) {
      case DeviceType.mobile:
        return base * 0.85;
      case DeviceType.tablet:
        return base * 0.95;
      case DeviceType.desktop:
        return base;
    }
  }

  static EdgeInsets sectionPadding(BuildContext context) {
    final type = getDeviceType(context);
    switch (type) {
      case DeviceType.mobile:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 40);
      case DeviceType.tablet:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 60);
      case DeviceType.desktop:
        return const EdgeInsets.symmetric(horizontal: 64, vertical: 80);
    }
  }
}
