import '../models/user.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _api;

  AuthService({required this._api});

  Future<User> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String studentType,
  }) async {
    final response = await _api.post('/auth/register', {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
      'student_type': studentType,
    });
    final user = User.fromJson(response['user'] as Map<String, dynamic>);
    final token = response['token'] as String;
    _api.setToken(token);
    return user.copyWith(token: token);
  }

  Future<User> login({
    required String identifier,
    required String password,
  }) async {
    final response = await _api.post('/auth/login', {
      'identifier': identifier,
      'password': password,
    });
    final user = User.fromJson(response['user'] as Map<String, dynamic>);
    final token = response['token'] as String;
    _api.setToken(token);
    return user.copyWith(token: token);
  }

  void logout() {
    _api.clearToken();
  }
}
