import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  // Save User details
  Future<void> saveUserData({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await _storage.write(key: 'fullName', value: fullName);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: password);
  }

  // Retrieve user data

  Future<Map<String, String?>> getUserData() async {
    String? fullName = await _storage.read(key: 'fullName');
    String? email = await _storage.read(key: 'email');
    String? password = await _storage.read(key: 'password');
    return {'fullName': fullName, 'email': email, 'password': password};
  }

  // Clear user data (optional for logout)
  Future<void> clearUserData() async {
    await _storage.deleteAll();
  }
}
