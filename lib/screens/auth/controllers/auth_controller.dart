// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/signin_model.dart'; // Your existing SignInModel

class AuthController with ChangeNotifier {
  final AuthService _authService;

  AuthController({AuthService? authService})
      : _authService = authService ?? AuthService();

  // State variables
  bool _isLoading = false;
  String? _error;
  SignInModel? _currentUser;

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  SignInModel? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Sign in method
  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.signIn(email, password);

    _isLoading = false;

    if (response.success) {
      _currentUser = response.user;
      _error = null;
      notifyListeners();
      return true;
    } else {
      _error = response.error;
      _currentUser = null;
      notifyListeners();
      return false;
    }
  }

  // Sign up method
  Future<bool> signUp(SignUpData signUpData) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.signUp(signUpData);

    _isLoading = false;

    if (response.success) {
      _error = null;
      notifyListeners();
      return true;
    } else {
      _error = response.error;
      notifyListeners();
      return false;
    }
  }

  // Forgot password method
  Future<bool> forgotPassword(String email) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.forgotPassword(email);

    _isLoading = false;

    if (response.success) {
      _error = null;
      notifyListeners();
      return true;
    } else {
      _error = response.error;
      notifyListeners();
      return false;
    }
  }

  // Social sign in method
  Future<bool> socialSignIn(SocialSignInData socialData) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await _authService.socialSignIn(socialData);

    _isLoading = false;

    if (response.success) {
      _currentUser = response.user;
      _error = null;
      notifyListeners();
      return true;
    } else {
      _error = response.error;
      notifyListeners();
      return false;
    }
  }

  // Sign out method
  void signOut() {
    _currentUser = null;
    _error = null;
    notifyListeners();
  }

  // Validate email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate password strength
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Validate confirm password
  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validate full name
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.split(' ').length < 2) {
      return 'Please enter your full name (first and last name)';
    }
    return null;
  }

  @override
  void dispose() {
    _authService.dispose();
    super.dispose();
  }
}