import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> authUser(String username, String password) async {
    try {
      final url = Uri.parse("https://dummyjson.com/auth/login");
      final response = await http
          .post(url, body: {"username": username, "password": password});
      secureStorage.write(
          key: "token", value: json.decode(response.body)["token"]);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<String> isAuthenticated() async {
    return await secureStorage.read(key: 'token') ?? '';
  }

  void logout() {
    secureStorage.delete(key: "token");
  }
}
