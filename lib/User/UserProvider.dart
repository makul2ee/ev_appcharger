import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';

  String get firstName => _firstName;
  String get lastName => _lastName;

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/users'));
    if (response.statusCode == 200) {
      final List<dynamic> userData = jsonDecode(response.body);
      if (userData.isNotEmpty) {
        final Map<String, dynamic> user = userData[0];
        _firstName = user['firstName'] ?? '';
        _lastName = user['lastName'] ?? '';
        notifyListeners();
      } else {
        throw Exception('ไม่พบข้อมูลผู้ใช้');
      }
    } else {
      throw Exception('ไม่สามารถโหลดข้อมูลผู้ใช้ได้');
    }
  }
}
