import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/course_service.dart';

class CourseProvider extends ChangeNotifier {
  final CourseService _courseService;
  List<Course> _courses = [];
  bool _isLoading = false;
  String? _error;

  CourseProvider({required this._courseService});

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Demo courses for when backend is unavailable
  static final List<Course> demoCourses = [
    Course(id: 1, name: 'UPSC Foundation', description: 'Complete UPSC Civil Services preparation with comprehensive coverage of all subjects.', duration: '12 Months', fee: 45000, level: 'Advanced'),
    Course(id: 2, name: 'SSC CGL Complete', description: 'Master all four tiers of SSC CGL examination with practice tests and study materials.', duration: '6 Months', fee: 15000, level: 'Intermediate'),
    Course(id: 3, name: 'Banking PO Prep', description: 'IBPS PO and SBI PO complete preparation with mock tests and interview guidance.', duration: '4 Months', fee: 12000, level: 'Intermediate'),
    Course(id: 4, name: 'Railway NTPC', description: 'Comprehensive preparation for RRB NTPC exam covering all stages.', duration: '3 Months', fee: 8000, level: 'Beginner'),
    Course(id: 5, name: 'State PSC General', description: 'Prepare for state-level public service commission exams with tailored content.', duration: '8 Months', fee: 25000, level: 'Advanced'),
    Course(id: 6, name: 'General Studies', description: 'Build a strong foundation in General Studies for all competitive examinations.', duration: '3 Months', fee: 5000, level: 'Beginner'),
  ];

  Future<void> loadCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _courses = await _courseService.getCourses();
    } catch (_) {
      _courses = demoCourses;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> addCourse(Course course) async {
    try {
      final created = await _courseService.createCourse(course);
      _courses.add(created);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> removeCourse(int id) async {
    try {
      await _courseService.deleteCourse(id);
      _courses.removeWhere((c) => c.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
