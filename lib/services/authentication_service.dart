// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://fleet-managemnt-backend-last-infama.onrender.com/api/user/create-user'; 

  final http.Client client;

  AuthService({http.Client? client}) : client = client ?? http.Client();

  // Sign in method
  Future<SignInResponse> signIn(String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return SignInResponse.success(SignInModel.fromJson(jsonResponse['user']));
      } else if (response.statusCode == 401) {
        return SignInResponse.error('Invalid email or password');
      } else if (response.statusCode == 400) {
        return SignInResponse.error('Please provide valid credentials');
      } else {
        return SignInResponse.error('Server error. Please try again later.');
      }
    } catch (e) {
      return SignInResponse.error('Network error. Please check your connection.');
    }
  }

  // Sign up method
  Future<SignUpResponse> signUp(SignUpData signUpData) async {
    try {
      // Validate password match
      if (signUpData.password != signUpData.confirmPassword) {
        return SignUpResponse.error('Passwords do not match');
      }

      final response = await client.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(signUpData.toJson()),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        return SignUpResponse.success('Account created successfully');
      } else if (response.statusCode == 400) {
        final error = json.decode(response.body);
        return SignUpResponse.error(error['message'] ?? 'Registration failed');
      } else if (response.statusCode == 409) {
        return SignUpResponse.error('Email already exists');
      } else {
        return SignUpResponse.error('Registration failed. Please try again.');
      }
    } catch (e) {
      return SignUpResponse.error('Network error. Please check your connection.');
    }
  }

  // Forgot password method
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/forgot-password'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        return ForgotPasswordResponse.success(
            'Password reset instructions sent to your email');
      } else if (response.statusCode == 404) {
        return ForgotPasswordResponse.error('Email not found');
      } else {
        return ForgotPasswordResponse.error('Failed to process request');
      }
    } catch (e) {
      return ForgotPasswordResponse.error('Network error. Please try again.');
    }
  }

  // Social sign in method
  Future<SignInResponse> socialSignIn(SocialSignInData socialData) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/social-signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(socialData.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return SignInResponse.success(SignInModel.fromJson(jsonResponse['user']));
      } else {
        return SignInResponse.error('Social sign in failed');
      }
    } catch (e) {
      return SignInResponse.error('Network error during social sign in');
    }
  }

  void dispose() {
    client.close();
  }
}

// Response classes
class SignInResponse {
  final SignInModel? user;
  final String? error;
  final bool success;

  SignInResponse.success(this.user)
      : error = null,
        success = true;

  SignInResponse.error(this.error)
      : user = null,
        success = false;
}

class SignUpResponse {
  final String? message;
  final String? error;
  final bool success;

  SignUpResponse.success(this.message)
      : error = null,
        success = true;

  SignUpResponse.error(this.error)
      : message = null,
        success = false;
}

class ForgotPasswordResponse {
  final String? message;
  final String? error;
  final bool success;

  ForgotPasswordResponse.success(this.message)
      : error = null,
        success = true;

  ForgotPasswordResponse.error(this.error)
      : message = null,
        success = false;
}

// Data classes
class SignUpData {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String? employeeNumber;
  final String? department;

  SignUpData({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.employeeNumber,
    this.department,
  });

  Map<String, dynamic> toJson() {
    final names = fullName.split(' ');
    final firstName = names.first;
    final lastName = names.length > 1 ? names.sublist(1).join(' ') : '';

    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'employeeNumber': employeeNumber,
      'department': department,
    };
  }
}

class SocialSignInData {
  final String provider; // 'google' or 'facebook'
  final String token;
  final String? email;
  final String? name;

  SocialSignInData({
    required this.provider,
    required this.token,
    this.email,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'token': token,
      'email': email,
      'name': name,
    };
  }
}