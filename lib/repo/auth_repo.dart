import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepo {
  final String baseUrl = 'https://fastapi-books-app.onrender.com';

  Future<String> signUp(String email, String name, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {
          'accept': ' application/json',
          'Content-Type': ' application/json'
        },
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw Exception(data['detail']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signIn'),
        headers: {
          'accept': ' application/json',
          'Content-Type': ' application/json'
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw Exception(data['detail']);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyEmail(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/verify'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['msg'];
      }
      throw Exception(data['detail'] ?? 'Failed to verify');
    } catch (e) {
      rethrow;
    }
  }
}
