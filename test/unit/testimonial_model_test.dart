import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/models/testimonial.dart';

void main() {
  group('Testimonial Model', () {
    test('fromJson creates Testimonial from valid JSON', () {
      final json = {
        'id': 1,
        'student_name': 'Priya Sharma',
        'message': 'Great platform!',
        'exam_name': 'UPSC',
        'rank': 'AIR 45',
        'rating': 5,
      };

      final testimonial = Testimonial.fromJson(json);

      expect(testimonial.id, 1);
      expect(testimonial.studentName, 'Priya Sharma');
      expect(testimonial.message, 'Great platform!');
      expect(testimonial.examName, 'UPSC');
      expect(testimonial.rank, 'AIR 45');
      expect(testimonial.rating, 5);
    });

    test('fromJson handles missing fields', () {
      final json = <String, dynamic>{};

      final testimonial = Testimonial.fromJson(json);

      expect(testimonial.id, isNull);
      expect(testimonial.studentName, '');
      expect(testimonial.message, '');
      expect(testimonial.examName, '');
      expect(testimonial.rank, '');
      expect(testimonial.rating, isNull);
    });

    test('toJson converts Testimonial to Map', () {
      final testimonial = Testimonial(
        id: 2,
        studentName: 'Rahul',
        message: 'Very helpful',
        examName: 'SSC',
        rank: 'Selected',
        rating: 4,
      );

      final json = testimonial.toJson();

      expect(json['id'], 2);
      expect(json['student_name'], 'Rahul');
      expect(json['message'], 'Very helpful');
      expect(json['exam_name'], 'SSC');
      expect(json['rank'], 'Selected');
      expect(json['rating'], 4);
    });

    test('roundtrip fromJson -> toJson', () {
      final original = {
        'id': 3,
        'student_name': 'Amit',
        'message': 'Excellent',
        'exam_name': 'Banking',
        'rank': 'Top 100',
        'rating': 5,
      };

      final testimonial = Testimonial.fromJson(original);
      final result = testimonial.toJson();

      expect(result['student_name'], original['student_name']);
      expect(result['rating'], original['rating']);
    });
  });
}
