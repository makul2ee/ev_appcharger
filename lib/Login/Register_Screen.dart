import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Login_Screen.dart';
import 'OTP_Screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isCheckedPolicy = false;
  bool _isCheckedTerms = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _FirstNameController = TextEditingController();
  TextEditingController _LastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser() async {
    // ฟังก์ชันตรวจสอบความถูกต้องของข้อมูล
    String? validateData() {
      if (_emailController.text.isEmpty ||
          !_emailController.text.contains('@')) {
        return 'อีเมลไม่ถูกต้อง';
      }
      if (_passwordController.text.isEmpty ||
          _passwordController.text.length < 6) {
        return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
      }
      // เพิ่มการตรวจสอบอื่นๆ ตามข้อกำหนดของ API
      return null;
    }

    var validationError = validateData();
    if (validationError != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ข้อผิดพลาด'),
            content: Text(validationError),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ตกลง'),
              ),
            ],
          );
        },
      );
      return;
    }

    var userData = {
      'name': _nameController.text,
      'Firstname': _FirstNameController.text,
      'Lastname': _LastNameController.text,
      'Phone': _PhoneController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    var response = await http.post(
      Uri.parse('https://ev-backend.logicton.com/api/appregister'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userData),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      // Parsing response body
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('token')) {
        // ignore: unused_local_variable
        Map<String, dynamic> tokenData = responseBody['token'];

        // จัดการข้อมูลโทเคนตามที่ต้องการ
        // ตัวอย่างเช่น เก็บข้อมูลใน local storage หรือ shared preferences

        // แทนที่หน้าจอด้วยหน้าจอ OTP
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OtpScreen()),
        );
      } else {
        // หากไม่มีข้อมูลโทเคน ให้แสดงข้อผิดพลาด
        showErrorDialog('Token not found in response.');
      }
    } else {
      // Parsing response body
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // Extracting error messages
      String errorMessage = '';
      if (responseBody.containsKey('error')) {
        Map<String, dynamic> errorData = responseBody['error'];
        errorData.forEach((key, value) {
          errorMessage += '${key}: ${value.join(', ')}\n';
        });
      } else {
        errorMessage = 'Unknown error occurred.';
      }

      // Showing error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Registration failed: $errorMessage'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

// ฟังก์ชันแสดงข้อผิดพลาด
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ข้อผิดพลาด'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ลงทะเบียน', textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 18),
                  Icon(
                    Icons.phone,
                    size: 18,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'หมายเลขโทรศัพท์',
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 92, 116, 250)),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'ป้อนหมายเลขโทรศัพท์ของคุณ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'คุณจะได้รับรหัส SMS ในขั้นตอนต่อไปของการยืนยัน',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // เบอร์โทรศัพท์
                    Text(
                      '* เบอร์โทรศัพท์',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _PhoneController,
                      decoration: InputDecoration(
                        hintText: 'เบอร์โทรศัพท์',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 10), // เพิ่มระยะห่างระหว่างส่วนต่าง ๆ

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // อีเมล
                    Text(
                      '* อีเมล',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'อีเมล',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 10), // เพิ่มระยะห่างระหว่างส่วนต่าง ๆ

// ส่วนที่เหลือของฟิลด์ที่เหลือทำแบบเดียวกัน
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ชื่อผู้ใช้
                    Text(
                      '* ชื่อผู้ใช้',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'ชื่อผู้ใช้',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 10), // เพิ่มระยะห่างระหว่างส่วนต่าง ๆ

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ชื่อ
                    Text(
                      '* ชื่อ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _FirstNameController,
                      decoration: InputDecoration(
                        hintText: 'ชื่อ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // นามสกุล
                    Text(
                      '* นามสกุล',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _LastNameController,
                      decoration: InputDecoration(
                        hintText: 'นามสกุล',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // รหัสผ่าน
                    Text(
                      '* รหัสผ่าน',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[200],
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'รหัสผ่าน',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.indigo[50],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'การดำเนินการต่อแสดงว่าคุณยอมรับข้อกำหนดการใช้งานและนโยบายความเป็นส่วนตัว',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'เงื่อนไขการให้บริการ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'โปรดรับทราบและยอมรับเงื่อนไขต่างๆเพื่อใช้บริการแอปพลิเคชั่น ****',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'โดยการทำเครื่องหมายในช่องและกดยอมรับในฟอร์มนี้ เพื่อยืนยันว่า',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          CheckboxListTile(
                            title: Text(
                              'ข้าพเจ้ายอมรับนโยบายการคุ้มครองข้อมูลทั้งหมด',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _isCheckedPolicy,
                            onChanged: (value) {
                              setState(() {
                                _isCheckedPolicy = value!;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          CheckboxListTile(
                            title: Text(
                              'ข้าพเจ้าได้ยอมรับเงื่อนไขและข้อกำหนดทั้งหมด',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _isCheckedTerms,
                            onChanged: (value) {
                              setState(() {
                                _isCheckedTerms = value!;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 140,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Action when reject button is pressed
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text('ปฏิเสธ'),
                                ),
                              ),
                              SizedBox(
                                width: 140,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_isCheckedPolicy && _isCheckedTerms) {
                                      await registerUser();
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'Please accept the policies and terms.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: Text('ยอมรับ'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 4,
        color: Colors.black,
      ),
    );
  }
}
