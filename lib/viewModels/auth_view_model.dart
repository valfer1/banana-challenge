import 'package:banana_challenge/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  String _token = "";
  bool _isLoading = true;

  Future<bool> login(String username, String password) async {
    final response = await AuthService().authUser(username, password);
    // _user = user;
    _isLoading = false;
    notifyListeners();
    return response;
  }

  void logout() {
    AuthService().logout();
    notifyListeners();
  }

  bool get isLoggedIn => _token != "";
  bool get isLoading => _isLoading;

  void checkToken() async {
    final response = await AuthService().isAuthenticated();
    _token = response;
    _isLoading = false;
    notifyListeners();
  }
}
