import 'package:flutter_test/flutter_test.dart';
import 'package:merit_zone/models/user.dart';

void main() {
  group('User Model', () {
    test('fromJson creates User from valid JSON', () {
      final json = {
        'id': 1,
        'name': 'Test User',
        'email': 'test@example.com',
        'mobile': '9876543210',
        'role': 'student',
        'student_type': 'online',
        'token': 'abc123',
      };

      final user = User.fromJson(json);

      expect(user.id, 1);
      expect(user.name, 'Test User');
      expect(user.email, 'test@example.com');
      expect(user.mobile, '9876543210');
      expect(user.role, 'student');
      expect(user.studentType, 'online');
      expect(user.token, 'abc123');
    });

    test('fromJson handles missing fields with defaults', () {
      final json = <String, dynamic>{};

      final user = User.fromJson(json);

      expect(user.id, isNull);
      expect(user.name, '');
      expect(user.email, '');
      expect(user.mobile, '');
      expect(user.role, 'student');
      expect(user.studentType, 'online');
      expect(user.token, isNull);
    });

    test('toJson converts User to Map', () {
      final user = User(
        id: 1,
        name: 'Test User',
        email: 'test@example.com',
        mobile: '9876543210',
        role: 'student',
        studentType: 'offline',
        token: 'xyz',
      );

      final json = user.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Test User');
      expect(json['email'], 'test@example.com');
      expect(json['mobile'], '9876543210');
      expect(json['role'], 'student');
      expect(json['student_type'], 'offline');
      expect(json['token'], 'xyz');
    });

    test('copyWith creates modified copy', () {
      final user = User(
        id: 1,
        name: 'Test User',
        email: 'test@example.com',
        mobile: '9876543210',
      );

      final updated = user.copyWith(name: 'Updated Name', token: 'new-token');

      expect(updated.name, 'Updated Name');
      expect(updated.token, 'new-token');
      expect(updated.email, 'test@example.com');
      expect(updated.id, 1);
    });

    test('copyWith preserves original when no args', () {
      final user = User(
        id: 5,
        name: 'Original',
        email: 'orig@test.com',
        mobile: '1111111111',
        role: 'admin',
        studentType: 'offline',
        token: 'tok',
      );

      final copy = user.copyWith();

      expect(copy.id, user.id);
      expect(copy.name, user.name);
      expect(copy.email, user.email);
      expect(copy.mobile, user.mobile);
      expect(copy.role, user.role);
      expect(copy.studentType, user.studentType);
      expect(copy.token, user.token);
    });

    test('fromJson then toJson roundtrip', () {
      final original = {
        'id': 10,
        'name': 'Roundtrip',
        'email': 'rt@test.com',
        'mobile': '5555555555',
        'role': 'faculty',
        'student_type': 'offline',
        'token': null,
      };

      final user = User.fromJson(original);
      final result = user.toJson();

      expect(result['id'], original['id']);
      expect(result['name'], original['name']);
      expect(result['email'], original['email']);
      expect(result['mobile'], original['mobile']);
      expect(result['role'], original['role']);
      expect(result['student_type'], original['student_type']);
    });
  });
}
