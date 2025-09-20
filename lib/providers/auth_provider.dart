import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_code/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock user data
      _user = User(
        id: '1',
        name: 'Aziz Louati',
        email: email,
        phone: '+1234567890',
        dateOfBirth: DateTime(1990, 1, 1),
        gender: 'Male',
        address: '123 Main St, City',
      );

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', _user!.toJson().toString());
      
    } catch (e) {
      _error = 'Login failed. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password, String phone) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock user data
      _user = User(
        id: '1',
        name: name,
        email: email,
        phone: phone,
      );

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', _user!.toJson().toString());
      
    } catch (e) {
      _error = 'Registration failed. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      // In a real app, you would parse the JSON string
      // For now, we'll create a mock user
      _user = User(
        id: '1',
        name: 'Aziz Louati',
        email: 'aziz@example.com',
        phone: '+1234567890',
      );
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
