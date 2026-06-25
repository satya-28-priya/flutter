import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/config/constants.dart';

void main() {
  group('AppConstants', () {
    test('appName is Merit Zone', () {
      expect(AppConstants.appName, 'Merit Zone');
    });

    test('baseUrl points to localhost API', () {
      expect(AppConstants.baseUrl, contains('localhost'));
      expect(AppConstants.baseUrl, contains('/api'));
    });

    test('menuItems has expected items', () {
      expect(AppConstants.menuItems.length, greaterThanOrEqualTo(10));
      expect(AppConstants.menuItems, contains('Home'));
      expect(AppConstants.menuItems, contains('Courses'));
      expect(AppConstants.menuItems, contains('Contact'));
      expect(AppConstants.menuItems, contains('Competitive Exams'));
    });

    test('banners has at least 3 banners', () {
      expect(AppConstants.banners.length, greaterThanOrEqualTo(3));
      for (final banner in AppConstants.banners) {
        expect(banner.containsKey('title'), true);
        expect(banner.containsKey('subtitle'), true);
        expect(banner['title']!.isNotEmpty, true);
      }
    });

    test('counters has expected data', () {
      expect(AppConstants.counters.length, 4);
      for (final counter in AppConstants.counters) {
        expect(counter.containsKey('label'), true);
        expect(counter.containsKey('value'), true);
        expect(counter.containsKey('icon'), true);
        expect(counter['value'] as int, greaterThan(0));
      }
    });

    test('lmsFeatures has expected features', () {
      expect(AppConstants.lmsFeatures.length, greaterThanOrEqualTo(9));
      for (final feature in AppConstants.lmsFeatures) {
        expect(feature.containsKey('title'), true);
        expect(feature.containsKey('icon'), true);
        expect(feature.containsKey('desc'), true);
      }
    });

    test('competitiveExams has all required exams', () {
      final examNames = AppConstants.competitiveExams
          .map((e) => e['name'])
          .toList();
      expect(examNames, contains('UPSC'));
      expect(examNames, contains('SSC'));
      expect(examNames, contains('Banking'));
      expect(examNames, contains('Railways'));
    });

    test('color values are valid', () {
      expect(AppConstants.primaryColor, isA<Color>());
      expect(AppConstants.secondaryColor, isA<Color>());
      expect(AppConstants.accentColor, isA<Color>());
      expect(AppConstants.darkBg, isA<Color>());
      expect(AppConstants.lightBg, isA<Color>());
    });

    test('breakpoints are ordered correctly', () {
      expect(AppConstants.mobileBreakpoint, lessThan(AppConstants.tabletBreakpoint));
      expect(AppConstants.tabletBreakpoint, lessThan(AppConstants.desktopBreakpoint));
    });
  });
}
