import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Sales_Force_App/database/database_helper.dart';
import 'package:Sales_Force_App/models/user_model.dart';
import 'package:Sales_Force_App/views/core/preloader_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var isLoggedIn = false.obs;
  var userData = {}.obs;

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // ✅ LOGIN
  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return false;
    }

    isLoading.value = true;

    try {
      User? user = await _databaseHelper.verifyUser(email, password);

      if (user != null) {
        final userDataMap = user.toMap();
        final token = _generateToken(user.id.toString());

        await _prefs.setString('user_token', token);
        await _prefs.setString('user_data', json.encode(userDataMap));

        isLoggedIn.value = true;
        userData.value = userDataMap;

        Get.snackbar('Success', 'Login successful');
        return true;
      } else {
        // Debug: print all users
        final allUsers = await _databaseHelper.getUsers();
        print("DEBUG Users in DB: ${allUsers.map((u) => u.toMap()).toList()}");

        Get.snackbar('Error', 'Invalid email or password');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ REGISTER
  Future<bool> register(
      String name, String email, String password, String role) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return false;
    }

    isLoading.value = true;

    try {
      User? existingUser = await _databaseHelper.getUserByEmail(email);

      if (existingUser != null) {
        Get.snackbar('Error', 'User with this email already exists');
        return false;
      }

      User newUser =
          User(name: name, email: email, password: password, role: role);
      int userId = await _databaseHelper.insertUser(newUser);

      if (userId > 0) {
        Get.snackbar('Success', 'Registration successful');
        return true;
      } else {
        Get.snackbar('Error', 'Registration failed');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during registration: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ LOGOUT
  void logout() async {
    try {
      await _prefs.remove('user_token');
      await _prefs.remove('user_data');

      isLoggedIn.value = false;
      userData.value = {};

      Get.offAll(() => PreloaderScreen());
      Get.snackbar('Success', 'Logged out successfully');
    } catch (e) {
      print('Error during logout: $e');
      Get.offAll(() => PreloaderScreen());
    }
  }

  // ✅ CHECK AUTH STATUS
  Future<bool> checkAuthStatus() async {
    try {
      final token = _prefs.getString('user_token');
      final userDataString = _prefs.getString('user_data');

      if (token != null && userDataString != null) {
        isLoggedIn.value = true;
        userData.value = json.decode(userDataString);
        return true;
      }

      isLoggedIn.value = false;
      return false;
    } catch (e) {
      print('Error checking auth status: $e');
      isLoggedIn.value = false;
      return false;
    }
  }

  // ✅ Get User Role
  String getUserRole() {
    return userData['role'] ?? 'customer';
  }

  // Token Generator
  String _generateToken(String userId) {
    return 'token_${userId}_${DateTime.now().millisecondsSinceEpoch}';
  }
}
