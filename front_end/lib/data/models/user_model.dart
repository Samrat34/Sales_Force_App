class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'company': company,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      company: map['company'] ?? '',
    );
  }
}
