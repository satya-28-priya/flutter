import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  User? _user;
  bool _isLoading = false;
  String? _error;

  AuthProvider({required this._authService});

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  String? get error => _error;
  String get userRole => _user?.role ?? 'student';

  Future<bool> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String studentType,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authService.register(
        name: name,
        email: email,
        mobile: mobile,
        password: password,
        studentType: studentType,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({
    required String identifier,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authService.login(
        identifier: identifier,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _user = null;
    _authService.logout();
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
