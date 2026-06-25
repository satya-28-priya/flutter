import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/models/course.dart';

void main() {
  group('Course Model', () {
    test('fromJson creates Course from valid JSON', () {
      final json = {
        'id': 1,
        'name': 'UPSC Foundation',
        'description': 'Complete UPSC preparation',
        'duration': '12 Months',
        'fee': 45000.0,
        'level': 'Advanced',
        'image_url': 'https://example.com/img.png',
        'is_active': true,
      };

      final course = Course.fromJson(json);

      expect(course.id, 1);
      expect(course.name, 'UPSC Foundation');
      expect(course.description, 'Complete UPSC preparation');
      expect(course.duration, '12 Months');
      expect(course.fee, 45000.0);
      expect(course.level, 'Advanced');
      expect(course.imageUrl, 'https://example.com/img.png');
      expect(course.isActive, true);
    });

    test('fromJson handles missing fields with defaults', () {
      final json = <String, dynamic>{};

      final course = Course.fromJson(json);

      expect(course.id, isNull);
      expect(course.name, '');
      expect(course.description, '');
      expect(course.duration, '');
      expect(course.fee, 0.0);
      expect(course.level, 'Beginner');
      expect(course.imageUrl, isNull);
      expect(course.isActive, true);
    });

    test('fromJson handles integer fee', () {
      final json = {
        'name': 'Test',
        'description': 'Desc',
        'duration': '3 Months',
        'fee': 5000,
        'level': 'Beginner',
      };

      final course = Course.fromJson(json);
      expect(course.fee, 5000.0);
    });

    test('toJson converts Course to Map', () {
      final course = Course(
        id: 2,
        name: 'SSC CGL',
        description: 'SSC preparation',
        duration: '6 Months',
        fee: 15000,
        level: 'Intermediate',
      );

      final json = course.toJson();

      expect(json['id'], 2);
      expect(json['name'], 'SSC CGL');
      expect(json['description'], 'SSC preparation');
      expect(json['duration'], '6 Months');
      expect(json['fee'], 15000);
      expect(json['level'], 'Intermediate');
      expect(json['image_url'], isNull);
      expect(json['is_active'], true);
    });

    test('fromJson then toJson roundtrip', () {
      final original = {
        'id': 5,
        'name': 'Banking PO',
        'description': 'Banking prep course',
        'duration': '4 Months',
        'fee': 12000.0,
        'level': 'Intermediate',
        'image_url': null,
        'is_active': true,
      };

      final course = Course.fromJson(original);
      final result = course.toJson();

      expect(result['name'], original['name']);
      expect(result['fee'], original['fee']);
      expect(result['level'], original['level']);
    });
  });
}
