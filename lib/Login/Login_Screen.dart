
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:ev_appcharger/Login/Register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus();
  }

  Future<void> _checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

 Future<void> _login() async {
    Map<String, String> data = {
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };

    try {
        // ส่งคำขอ POST ไปยัง API
        var response = await http.post(
            Uri.parse('https://ev-backend.logicton.com/api/applogin'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: jsonEncode(data),
        );

        // ตรวจสอบสถานะการตอบสนองของ API
        if (response.statusCode == 200) {
            // แปลง JSON body ของการตอบสนอง
            var responseData = json.decode(response.body);
            var token = responseData['token'];
            var user = responseData['user'];

            // ตรวจสอบว่ามีข้อมูล token และข้อมูลผู้ใช้
            if (token != null && user != null) {
                // ตรวจสอบสถานะของผู้ใช้
                int userStatus = user['Status'];

                if (userStatus == 1) {
                    // ผู้ใช้สามารถเข้าสู่ระบบได้หากสถานะเป็น 1
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    
                    // บันทึกข้อมูลผู้ใช้และ token ใน SharedPreferences
                    prefs.setInt('userId', user['id']);
                    prefs.setString('userName', user['name']);
                    prefs.setString('userFirstname', user['Firstname']);
                    prefs.setString('userLastname', user['Lastname']);
                    prefs.setString('userEmail', user['email']);
                    prefs.setString('userPhone', user['Phone']);
                    prefs.setInt('userStatus', user['Status']);

                    // บันทึกข้อมูล token
                    prefs.setString('tokenName', token['name']);
                    prefs.setStringList(
                        'tokenAbilities', List<String>.from(token['abilities']));
                    prefs.setString('tokenableId', token['tokenable_id'].toString());
                    prefs.setString('tokenableType', token['tokenable_type']);
                    prefs.setString('tokenExpiresAt', token['expires_at'] ?? '');
                    prefs.setString('tokenUpdatedAt', token['updated_at']);
                    prefs.setString('tokenCreatedAt', token['created_at']);
                    prefs.setString('tokenId', token['id'].toString());

                    // บันทึกสถานะการเข้าสู่ระบบ
                    prefs.setBool('isLoggedIn', true);

                    // อัปเดตสถานะการล็อกอินในแอป
                    setState(() {
                        _isLoggedIn = true;
                    });

                    // นำผู้ใช้ไปยังหน้า Homepage1
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage1()),
                    );
                } else {
                    // แสดงข้อความผิดพลาดหากสถานะผู้ใช้เป็น 0
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'ข้อผิดพลาด',
                        text: 'บัญชีนี้ถูกระงับหรือถูกลบออก โปรดติดต่อผู้ดูแลระบบ',
                        confirmBtnText: 'ตกลง',
                    );
                }
            } else {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'ข้อผิดพลาดในการตอบสนอง',
                    text: 'ไม่มีข้อมูล token หรือข้อมูลผู้ใช้ในคำตอบ',
                    confirmBtnText: 'ตกลง',
                );
            }
        } else {
            // แสดงข้อความผิดพลาดหากสถานะการตอบสนองไม่ใช่ 200
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: 'ข้อผิดพลาดในการร้องขอ',
                text: 'ไม่สามารถเข้าสู่ระบบได้ โปรดลองใหม่อีกครั้ง',
                confirmBtnText: 'ตกลง',
            );
        }
    } catch (e) {
        // แสดงข้อความผิดพลาดหากเกิดข้อผิดพลาดในการเชื่อมต่อ
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'ข้อผิดพลาดในการเชื่อมต่อ',
            text: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
            confirmBtnText: 'ตกลง',
        );
        print('Error: $e');
    }
}

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return Homepage1();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 201, 243),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ยินดีต้อนรับ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'เดินทางได้อย่างสะดวกและจองสถานีชาร์จ\nที่ใกล้ที่สุดของคุณ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '* อีเมล', // ข้อความที่อธิบายฟิลด์
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[200],
                    ),
                  ),
                  SizedBox(height: 4), // เพิ่มระยะห่างระหว่างข้อความและ TextField
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'อีเมล',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 16,
                        color: Color.fromARGB(255, 92, 116, 250),
                      ),
                      filled: true,
                      fillColor: Colors.indigo[50],
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '* รหัสผ่าน', // ข้อความที่อธิบายฟิลด์
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[200],
                    ),
                  ),
                  SizedBox(height: 4), // เพิ่มระยะห่างระหว่างข้อความและ TextField
                  TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'รหัสผ่าน',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 16,
                        color: Color.fromARGB(255, 92, 116, 250),
                      ),
                      suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(
                                Icons.visibility_off,
                                color: Color.fromARGB(255, 92, 116, 250),
                                size: 16,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 92, 116, 250),
                                size: 16,
                              ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.indigo[50],
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'ลืมรหัสผ่าน',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    side: BorderSide(color: Color.fromARGB(255, 92, 116, 250)),
                    backgroundColor: Color.fromARGB(255, 92, 116, 250),
                  ),
                  onPressed: _login,
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    side: BorderSide(color: Color.fromARGB(255, 92, 116, 250)),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'ลงทะเบียน',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Bootstrap.google,
                    color: Colors.white,
                    size: 16,
                  ),
                  label: Text('ลงชื่อเข้าใช้ Google',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    // ใส่ฟังก์ชั่นสำหรับการกดปุ่ม Google ที่นี่
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 219, 68, 55), // สีพื้นหลังปุ่ม Google
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18),
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
