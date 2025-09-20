class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String role; // 'admin', 'driver', 'manager'
  final DateTime lastLogin;
  final bool isOnline;
  final String? profileImage;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.lastLogin,
    required this.isOnline,
    this.profileImage,
  });

  // Factory constructor for creating User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      lastLogin: DateTime.parse(json['lastLogin']),
      isOnline: json['isOnline'],
      profileImage: json['profileImage'],
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'lastLogin': lastLogin.toIso8601String(),
      'isOnline': isOnline,
      'profileImage': profileImage,
    };
  }
}
