import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/models/exam.dart';

void main() {
  group('Exam Model', () {
    test('fromJson creates Exam from valid JSON', () {
      final json = {
        'id': 1,
        'name': 'UPSC',
        'eligibility': 'Graduate',
        'exam_pattern': 'Prelims + Mains + Interview',
        'syllabus': 'General Studies, Optional Subject',
        'preparation_strategy': 'Start with NCERT',
        'course_available': true,
        'description': 'Civil Services',
      };

      final exam = Exam.fromJson(json);

      expect(exam.id, 1);
      expect(exam.name, 'UPSC');
      expect(exam.eligibility, 'Graduate');
      expect(exam.examPattern, 'Prelims + Mains + Interview');
      expect(exam.syllabus, 'General Studies, Optional Subject');
      expect(exam.preparationStrategy, 'Start with NCERT');
      expect(exam.courseAvailable, true);
      expect(exam.description, 'Civil Services');
    });

    test('fromJson handles missing fields', () {
      final json = <String, dynamic>{};

      final exam = Exam.fromJson(json);

      expect(exam.id, isNull);
      expect(exam.name, '');
      expect(exam.eligibility, '');
      expect(exam.examPattern, '');
      expect(exam.syllabus, '');
      expect(exam.preparationStrategy, '');
      expect(exam.courseAvailable, true);
      expect(exam.description, isNull);
    });

    test('toJson converts Exam to Map', () {
      final exam = Exam(
        id: 3,
        name: 'SSC',
        eligibility: '12th Pass',
        examPattern: 'Tier I + Tier II',
        description: 'Staff Selection',
      );

      final json = exam.toJson();

      expect(json['id'], 3);
      expect(json['name'], 'SSC');
      expect(json['eligibility'], '12th Pass');
      expect(json['exam_pattern'], 'Tier I + Tier II');
      expect(json['course_available'], true);
      expect(json['description'], 'Staff Selection');
    });

    test('constructor defaults', () {
      final exam = Exam(
        name: 'Test',
        eligibility: 'Any',
        examPattern: 'MCQ',
      );

      expect(exam.id, isNull);
      expect(exam.syllabus, '');
      expect(exam.preparationStrategy, '');
      expect(exam.courseAvailable, true);
      expect(exam.description, isNull);
    });

    test('roundtrip fromJson -> toJson', () {
      final original = {
        'id': 7,
        'name': 'Railways',
        'eligibility': 'ITI',
        'exam_pattern': 'CBT + Physical',
        'syllabus': 'Math, GK, Reasoning',
        'preparation_strategy': 'Focus on speed',
        'course_available': false,
        'description': 'RRB exams',
      };

      final exam = Exam.fromJson(original);
      final result = exam.toJson();

      expect(result['name'], original['name']);
      expect(result['exam_pattern'], original['exam_pattern']);
      expect(result['course_available'], original['course_available']);
    });
  });
}
