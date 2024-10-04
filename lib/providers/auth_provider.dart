import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    _currentUser = await AuthService.login(username, password);
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> register(String username, String password, String email) async {
    await AuthService.register(username, password, email);
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
