import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String _userKey = 'current_user';

  Future<User?> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Demo users for different roles
    final demoUsers = {
      'admin@example.com': User(
        id: '1',
        name: 'Managing Director',
        email: 'admin@example.com',
        role: 'Super Admin',
        company: 'SalesForce CRM',
      ),
      'employee@example.com': User(
        id: '2',
        name: 'John Doe',
        email: 'employee@example.com',
        role: 'Company Employee',
        company: 'SalesForce CRM',
      ),
      'client@example.com': User(
        id: '3',
        name: 'ABC Distributors Ltd',
        email: 'client@example.com',
        role: 'Client',
        company: 'ABC Distributors Ltd',
      ),
    };

    if (demoUsers.containsKey(email) && password == 'password') {
      final user = demoUsers[email];
      await _saveUser(user!);
      return user;
    }

    return null;
  }

  Future<void> _saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.toMap().toString());
  }

  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);
    if (userString != null) {
      // Parse user data (in a real app, you'd use proper serialization)
      return User(
        id: '1',
        name: 'Demo User',
        email: 'demo@example.com',
        role: 'Demo Role',
        company: 'Demo Company',
      );
    }
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
