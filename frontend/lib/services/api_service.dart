import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl =
      "http://192.168.0.105:8080/api/auth"; // 👈 replace with your PC IP
  static String? token;

  /// 🔑 Login
  static Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      token =
          data['token']; // Assuming your Spring Boot returns { "token": "..." }
      return token!;
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }

  /// 📝 Register
  static Future<void> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    if (response.statusCode != 200) {
      throw Exception("Registration failed: ${response.body}");
    }
  }

  /// 📊 Get Dashboard (JWT Protected)
  static Future<String> getDashboard() async {
    final response = await http.get(
      Uri.parse("http://192.168.0.105:8080/api/dashboard"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Failed to fetch dashboard: ${response.body}");
    }
  }
}
