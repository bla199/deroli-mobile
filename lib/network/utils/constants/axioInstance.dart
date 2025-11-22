// lib/network/utils/constants/axioInstance.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deroli_mobile/network/utils/constants.dart';

/// HTTP client instance similar to axios
/// Provides base URL, timeout, headers, and interceptors
class AxiosInstance {
  // Base URL - can be set from Constants or environment
  static String get baseURL => Constants.apiUrl.isNotEmpty
      ? Constants.apiUrl
      : 'http://localhost:8000'; // Default fallback

  // Timeout duration
  static const Duration timeout = Duration(seconds: 10);

  // Default headers
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
  };

  /// Get stored token (replace with your actual storage mechanism)
  /// For now using a simple static variable - you can replace with SharedPreferences
  static String? _token;

  static String? getToken() {
    // TODO: Replace with actual storage (SharedPreferences, SecureStorage, etc.)
    // Example with SharedPreferences:
    // final prefs = await SharedPreferences.getInstance();
    // return prefs.getString('token');
    return _token;
  }

  static Future<void> setToken(String? token) {
    // TODO: Replace with actual storage
    // Example with SharedPreferences:
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', token);
    _token = token;
    return Future.value();
  }

  /// Request interceptor - adds auth token to headers
  static Map<String, String> _addAuthHeaders(Map<String, String> headers) {
    final token = getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  /// Response interceptor - handles errors globally
  static void _handleError(dynamic error) {
    print('API Error: $error');
    // You can add more error handling logic here
    // e.g., show toast, log to crashlytics, etc.
  }

  /// Make a GET request
  static Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      // Build URL with query parameters
      Uri uri = Uri.parse('$baseURL$endpoint');
      if (queryParameters != null && queryParameters.isNotEmpty) {
        uri = uri.replace(
          queryParameters: queryParameters.map(
            (key, value) => MapEntry(key, value.toString()),
          ),
        );
      }

      // Merge headers
      final requestHeaders = {...defaultHeaders, ...?headers};

      // Apply request interceptor (add auth token)
      final finalHeaders = _addAuthHeaders(requestHeaders);

      // Make request with timeout
      final response = await http
          .get(uri, headers: finalHeaders)
          .timeout(timeout);

      // Apply response interceptor
      if (response.statusCode >= 400) {
        _handleError('HTTP ${response.statusCode}: ${response.body}');
      }

      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Make a POST request
  static Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseURL$endpoint');

      // Merge headers
      final requestHeaders = {...defaultHeaders, ...?headers};

      // Apply request interceptor (add auth token)
      final finalHeaders = _addAuthHeaders(requestHeaders);

      // Encode body
      final body = data != null ? json.encode(data) : null;

      // Make request with timeout
      final response = await http
          .post(uri, headers: finalHeaders, body: body)
          .timeout(timeout);

      // Apply response interceptor
      if (response.statusCode >= 400) {
        _handleError('HTTP ${response.statusCode}: ${response.body}');
      }

      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Make a PUT request
  static Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseURL$endpoint');

      // Merge headers
      final requestHeaders = {...defaultHeaders, ...?headers};

      // Apply request interceptor (add auth token)
      final finalHeaders = _addAuthHeaders(requestHeaders);

      // Encode body
      final body = data != null ? json.encode(data) : null;

      // Make request with timeout
      final response = await http
          .put(uri, headers: finalHeaders, body: body)
          .timeout(timeout);

      // Apply response interceptor
      if (response.statusCode >= 400) {
        _handleError('HTTP ${response.statusCode}: ${response.body}');
      }

      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Make a DELETE request
  static Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final uri = Uri.parse('$baseURL$endpoint');

      // Merge headers
      final requestHeaders = {...defaultHeaders, ...?headers};

      // Apply request interceptor (add auth token)
      final finalHeaders = _addAuthHeaders(requestHeaders);

      // Encode body if provided
      final body = data != null ? json.encode(data) : null;

      // Make request with timeout
      final response = await http
          .delete(uri, headers: finalHeaders, body: body)
          .timeout(timeout);

      // Apply response interceptor
      if (response.statusCode >= 400) {
        _handleError('HTTP ${response.statusCode}: ${response.body}');
      }

      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Make a PATCH request
  static Future<http.Response> patch(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseURL$endpoint');

      // Merge headers
      final requestHeaders = {...defaultHeaders, ...?headers};

      // Apply request interceptor (add auth token)
      final finalHeaders = _addAuthHeaders(requestHeaders);

      // Encode body
      final body = data != null ? json.encode(data) : null;

      // Make request with timeout
      final response = await http
          .patch(uri, headers: finalHeaders, body: body)
          .timeout(timeout);

      // Apply response interceptor
      if (response.statusCode >= 400) {
        _handleError('HTTP ${response.statusCode}: ${response.body}');
      }

      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }
}
