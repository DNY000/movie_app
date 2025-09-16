import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

extension HttpMethodExtension on HttpMethod {
  int get expectedStatus {
    switch (this) {
      case HttpMethod.get:
      case HttpMethod.put:
      case HttpMethod.patch:
      case HttpMethod.delete:
        return 200;
      case HttpMethod.post:
        return 201;
    }
  }

  String get name => toString().split('.').last.toUpperCase();
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class ApiClient {
  static final ApiClient instance = ApiClient._internal();
  factory ApiClient() => instance;
  ApiClient._internal();

  final http.Client _client = http.Client();

  Future<http.Response> fetchApi({
    required HttpMethod method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse(url);
      final encodedBody = body != null ? jsonEncode(body) : null;
      late http.Response response;

      switch (method) {
        case HttpMethod.get:
          response = await _client.get(uri, headers: headers);
          break;
        case HttpMethod.post:
          response = await _client.post(uri, headers: headers, body: encodedBody);
          break;
        case HttpMethod.put:
          response = await _client.put(uri, headers: headers, body: encodedBody);
          break;
        case HttpMethod.patch:
          response = await _client.patch(uri, headers: headers, body: encodedBody);
          break;
        case HttpMethod.delete:
          response = await _client.delete(uri, headers: headers, body: encodedBody);
          break;
      }

      if (response.statusCode < 200 || response.statusCode >= 300) {
        final errorMessage = _extractErrorMessage(response.body) ?? _mapStatusMessage(response.statusCode);
        throw ApiException(errorMessage, statusCode: response.statusCode);
      }

      return response;
    } on http.ClientException catch (e) {
      throw ApiException('Client error: ${e.message}');
    } on TimeoutException {
      throw ApiException('Request timed out');
    } catch (e) {
      throw ApiException('Unknown error: $e');
    }
  }

  String? _extractErrorMessage(String body) {
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        return decoded['message'] ?? decoded['detail'] ?? decoded['title'];
      }
    } catch (_) {}
    return null;
  }

  String _mapStatusMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 422:
        return 'Unprocessable Entity';
      case 500:
        return 'Internal Server Error';
      default:
        return 'HTTP error: $statusCode';
    }
  }
}
