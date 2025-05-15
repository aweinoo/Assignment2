// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'authservice.dart';

// class TaskStorage {
//   final _storage = const FlutterSecureStorage();
//   final _authService = AuthService();

//   Future<void> saveTasks(List<String> tasks) async {
//     final email = await _authService.getLoggedInUserEmail();
//     if (email != null) {
//       await _storage.write(key: 'tasks_$email', value: jsonEncode(tasks));
//     }
//   }

//   Future<List<String>> loadTasks() async {
//     final email = await _authService.getLoggedInUserEmail();
//     if (email != null) {
//       final data = await _storage.read(key: 'tasks_$email');
//       if (data != null) {
//         return List<String>.from(jsonDecode(data));
//       }
//     }
//     return [];
//   }
// }
