import 'package:sales_force_app/domain/models/user_role.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final UserRole role;
  final String? profileImage;
  final DateTime createdAt;
  final bool isActive;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.profileImage,
    required this.createdAt,
    required this.isActive,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      role: UserRole.values[map['role']],
      profileImage: map['profileImage'],
      createdAt: DateTime.parse(map['createdAt']),
      isActive: map['isActive'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.index,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }
}
