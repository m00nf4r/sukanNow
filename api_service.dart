import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000"; // local backend

  static Future<List<dynamic>> getUsers() async {
    final res = await http.get(Uri.parse("$baseUrl/users"));
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return json.decode(res.body);
  }
}
