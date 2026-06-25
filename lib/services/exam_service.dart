import '../models/exam.dart';
import 'api_service.dart';

class ExamService {
  final ApiService _api;

  ExamService({required this._api});

  Future<List<Exam>> getExams() async {
    final response = await _api.get('/exams');
    final exams = (response['exams'] as List<dynamic>)
        .map((e) => Exam.fromJson(e as Map<String, dynamic>))
        .toList();
    return exams;
  }

  Future<Exam> getExam(int id) async {
    final response = await _api.get('/exams/$id');
    return Exam.fromJson(response);
  }

  Future<Exam> createExam(Exam exam) async {
    final response = await _api.post('/exams', exam.toJson());
    return Exam.fromJson(response);
  }

  Future<void> deleteExam(int id) async {
    await _api.delete('/exams/$id');
  }
}
