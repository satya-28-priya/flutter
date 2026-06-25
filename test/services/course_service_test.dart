import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:merit_zone/models/course.dart';
import 'package:merit_zone/services/api_service.dart';
import 'package:merit_zone/services/course_service.dart';

void main() {
  group('CourseService', () {
    test('getCourses returns list of courses', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.path, contains('/courses'));
        return http.Response(
          jsonEncode({
            'courses': [
              {
                'id': 1,
                'name': 'UPSC Foundation',
                'description': 'Desc',
                'duration': '12 Months',
                'fee': 45000.0,
                'level': 'Advanced',
                'image_url': null,
                'is_active': true,
              },
              {
                'id': 2,
                'name': 'SSC CGL',
                'description': 'Desc 2',
                'duration': '6 Months',
                'fee': 15000.0,
                'level': 'Intermediate',
                'image_url': null,
                'is_active': true,
              },
            ],
          }),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final courseService = CourseService(api: api);

      final courses = await courseService.getCourses();

      expect(courses.length, 2);
      expect(courses[0].name, 'UPSC Foundation');
      expect(courses[1].name, 'SSC CGL');
    });

    test('getCourse returns single course', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.path, contains('/courses/1'));
        return http.Response(
          jsonEncode({
            'id': 1,
            'name': 'UPSC Foundation',
            'description': 'Full course',
            'duration': '12 Months',
            'fee': 45000.0,
            'level': 'Advanced',
            'image_url': null,
            'is_active': true,
          }),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final courseService = CourseService(api: api);

      final course = await courseService.getCourse(1);

      expect(course.id, 1);
      expect(course.name, 'UPSC Foundation');
    });

    test('createCourse sends course data', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'POST');
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['name'], 'New Course');
        return http.Response(
          jsonEncode({
            'id': 3,
            'name': 'New Course',
            'description': 'New desc',
            'duration': '3 Months',
            'fee': 5000.0,
            'level': 'Beginner',
            'image_url': null,
            'is_active': true,
          }),
          201,
        );
      });

      final api = ApiService(client: mockClient);
      final courseService = CourseService(api: api);

      final course = await courseService.createCourse(Course(
        name: 'New Course',
        description: 'New desc',
        duration: '3 Months',
        fee: 5000,
        level: 'Beginner',
      ));

      expect(course.id, 3);
      expect(course.name, 'New Course');
    });

    test('deleteCourse sends delete request', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'DELETE');
        expect(request.url.path, contains('/courses/1'));
        return http.Response(
          jsonEncode({'message': 'Deleted'}),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final courseService = CourseService(api: api);

      await courseService.deleteCourse(1);
    });
  });
}
