import 'dart:convert';
import 'package:flutter_app/features/otp/repository/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const _tokenKey = "token";
  static const _userKey = "user";

  static Future<void> saveAuth(AuthResponse auth) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, auth.accessToken);
    await prefs.setString(_userKey, jsonEncode(auth.user));
    await prefs.setBool('is_logged_in', true);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString(_userKey);

    if (userStr != null) {
      return jsonDecode(userStr);
    }
    return null;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<int?> getEmployeeId() async {
    final user = await getUser();

    if (user == null) return null;

    final rawId = user['employee_id'] ?? user['id'];

    if (rawId == null) return null;

    return int.tryParse(rawId.toString());
  }
}
