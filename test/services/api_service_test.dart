import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:merit_zone/services/api_service.dart';

void main() {
  group('ApiService', () {
    test('get sends GET request and returns parsed response', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.path, contains('/api/courses'));
        return http.Response(
          jsonEncode({'courses': []}),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final result = await api.get('/courses');

      expect(result, isA<Map<String, dynamic>>());
      expect(result['courses'], isA<List>());
    });

    test('post sends POST request with body', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'POST');
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['name'], 'Test');
        return http.Response(
          jsonEncode({'id': 1, 'name': 'Test'}),
          201,
        );
      });

      final api = ApiService(client: mockClient);
      final result = await api.post('/courses', {'name': 'Test'});

      expect(result['id'], 1);
    });

    test('put sends PUT request', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'PUT');
        return http.Response(
          jsonEncode({'id': 1, 'name': 'Updated'}),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final result = await api.put('/courses/1', {'name': 'Updated'});

      expect(result['name'], 'Updated');
    });

    test('delete sends DELETE request', () async {
      final mockClient = MockClient((request) async {
        expect(request.method, 'DELETE');
        return http.Response(
          jsonEncode({'message': 'Deleted'}),
          200,
        );
      });

      final api = ApiService(client: mockClient);
      final result = await api.delete('/courses/1');

      expect(result['message'], 'Deleted');
    });

    test('setToken adds Authorization header', () async {
      final mockClient = MockClient((request) async {
        expect(request.headers['Authorization'], 'Bearer test-token');
        return http.Response(jsonEncode({'ok': true}), 200);
      });

      final api = ApiService(client: mockClient);
      api.setToken('test-token');
      await api.get('/test');
    });

    test('clearToken removes Authorization header', () async {
      final mockClient = MockClient((request) async {
        expect(request.headers.containsKey('Authorization'), false);
        return http.Response(jsonEncode({'ok': true}), 200);
      });

      final api = ApiService(client: mockClient);
      api.setToken('test-token');
      api.clearToken();
      await api.get('/test');
    });

    test('throws ApiException on error response', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({'detail': 'Not found'}),
          404,
        );
      });

      final api = ApiService(client: mockClient);

      expect(
        () => api.get('/nonexistent'),
        throwsA(isA<ApiException>()),
      );
    });

    test('ApiException has correct properties', () {
      final exception = ApiException(statusCode: 404, message: 'Not found');

      expect(exception.statusCode, 404);
      expect(exception.message, 'Not found');
      expect(exception.toString(), contains('404'));
      expect(exception.toString(), contains('Not found'));
    });

    test('request includes Content-Type header', () async {
      final mockClient = MockClient((request) async {
        expect(request.headers['Content-Type'], 'application/json');
        return http.Response(jsonEncode({'ok': true}), 200);
      });

      final api = ApiService(client: mockClient);
      await api.get('/test');
    });
  });
}
