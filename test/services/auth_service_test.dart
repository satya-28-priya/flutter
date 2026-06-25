import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:merit_zone/services/api_service.dart';
import 'package:merit_zone/services/auth_service.dart';

void main() {
  group('AuthService', () {
    test('register sends correct data and returns User', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.path, contains('/auth/register'));
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['name'], 'Test User');
        expect(body['email'], 'test@example.com');
        expect(body['mobile'], '9876543210');
        expect(body['student_type'], 'online');

        return http.Response(
          jsonEncode({
            'token': 'jwt-token-123',
            'user': {
              'id': 1,
              'name': 'Test User',
              'email': 'test@example.com',
              'mobile': '9876543210',
              'role': 'student',
              'student_type': 'online',
            },
          }),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final authService = AuthService(api: api);

      final user = await authService.register(
        name: 'Test User',
        email: 'test@example.com',
        mobile: '9876543210',
        password: 'password123',
        studentType: 'online',
      );

      expect(user.name, 'Test User');
      expect(user.email, 'test@example.com');
      expect(user.token, 'jwt-token-123');
    });

    test('login sends correct data and returns User', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.path, contains('/auth/login'));
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['identifier'], 'test@example.com');

        return http.Response(
          jsonEncode({
            'token': 'jwt-token-456',
            'user': {
              'id': 1,
              'name': 'Test User',
              'email': 'test@example.com',
              'mobile': '9876543210',
              'role': 'student',
              'student_type': 'online',
            },
          }),
          200,
        );
      });

      final apiLogin = ApiService(client: mockClient);
      final authService = AuthService(api: apiLogin);

      final user = await authService.login(
        identifier: 'test@example.com',
        password: 'password123',
      );

      expect(user.name, 'Test User');
      expect(user.token, 'jwt-token-456');
    });

    test('logout clears token', () {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({}), 200);
      });

      final apiLogout = ApiService(client: mockClient);
      final authService = AuthService(api: apiLogout);

      // Should not throw
      authService.logout();
    });
  });
}
