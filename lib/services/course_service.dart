import '../models/course.dart';
import 'api_service.dart';

class CourseService {
  final ApiService _api;

  CourseService({required this._api});

  Future<List<Course>> getCourses() async {
    final response = await _api.get('/courses');
    final courses = (response['courses'] as List<dynamic>)
        .map((c) => Course.fromJson(c as Map<String, dynamic>))
        .toList();
    return courses;
  }

  Future<Course> getCourse(int id) async {
    final response = await _api.get('/courses/$id');
    return Course.fromJson(response);
  }

  Future<Course> createCourse(Course course) async {
    final response = await _api.post('/courses', course.toJson());
    return Course.fromJson(response);
  }

  Future<Course> updateCourse(int id, Course course) async {
    final response = await _api.put('/courses/$id', course.toJson());
    return Course.fromJson(response);
  }

  Future<void> deleteCourse(int id) async {
    await _api.delete('/courses/$id');
  }
}
