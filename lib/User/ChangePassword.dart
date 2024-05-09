import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; // นำเข้าแพ็คเกจ http
import 'package:quickalert/quickalert.dart'; // นำเข้าแพ็คเกจ quickalert
import 'UserList.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  bool _obscureText = true;

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs?.getString('userEmail');
    setState(() {
      emailController.text = userEmail ?? '';
    });
  }

  Future<void> changePassword() async {
    String oldPassword = passwordController.text;
    String newPassword = newpasswordController.text;

    prefs = await SharedPreferences.getInstance();
    int userId = prefs?.getInt('userId') ?? 0;

    String apiUrl = 'https://ev-backend.logicton.com/api/users/update-password/$userId';

    Map<String, String> data = {
      'old_password': oldPassword,
      'password': newPassword,
    };

    http.Response response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // ประสบความสำเร็จ
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'สำเร็จ',
        text: 'รหัสผ่านเปลี่ยนสำเร็จ',
        confirmBtnText: 'ตกลง',
        onConfirmBtnTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserList(onSetThemeMode: (ThemeMode) {}),
            ),
          );
        },
      );
    } else {
      // ล้มเหลว
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'เกิดข้อผิดพลาด',
        text: 'เกิดข้อผิดพลาด: ${response.body}',
        confirmBtnText: 'ตกลง',
        onConfirmBtnTap: () {
           Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  Widget build(Build_context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: const Text(
          'เปลี่ยนรหัสผ่าน',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserList(onSetThemeMode: (ThemeMode) {}),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
             Text(
              '* อีเมลปัจจุบันที่ใช้งาน',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[200],
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  size: 16,
                  color: Color.fromARGB(255, 92, 116, 250),
                ),
                filled: true,
                fillColor: Colors.indigo[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            const SizedBox(height: 15),
             Text(
              '* รหัสผ่านปัจจุบัน',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[200],
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 16,
                  color: Color.fromARGB(255, 92, 116, 250),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromARGB(255, 92, 116, 250),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.indigo[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            const SizedBox(height: 15),
             Text(
              '* รหัสผ่านใหม่',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[200],
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: newpasswordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 16,
                  color: Color.fromARGB(255, 92, 116, 250),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.indigo[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 92, 116, 250),
                  ),
                  onPressed: changePassword,
                  child: const Text(
                    'เปลี่ยนรหัสผ่าน',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
