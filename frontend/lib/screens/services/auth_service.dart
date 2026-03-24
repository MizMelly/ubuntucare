import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.0.2.2:5000/api/auth";

  // Simulated login function (for testing without backend)
  static Future<bool> simulatedLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay
    if (email == "test@example.com" && password == "123456") {
      return true;
    }
    return false;
  }

  // Simulated register function
  static Future<bool> simulatedRegister(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Real REGISTER with backend
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": name,
          "email": email,
          "phone": phone,
          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"error": "Network error"};
    }
  }

  // Real LOGIN with backend
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"error": "Network error"};
    }
  }
}