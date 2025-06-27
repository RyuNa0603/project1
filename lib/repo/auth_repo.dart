import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepo {
  final String baseUrl = 'https://fastapi-books-app.onrender.com/docs';

  Future<String> signUp(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signUp'),
        headers: {
          'accept': ' application/json',
          'Content-Type': ' application/json'
        },
        body: jsonEncode(
          {
            "name":"Kim Ryu Na",
            "email": email,
            "password": password,
          },
        ),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['smg'];
      }
      throw Exception(data['detail']);
    } catch (e) {
      rethrow;
    }
  }
}
