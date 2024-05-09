import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';


class Changedatauser extends StatefulWidget {
  @override
  _ChangedatauserState createState() => _ChangedatauserState();
}

class _ChangedatauserState extends State<Changedatauser> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    prefs = await SharedPreferences.getInstance();

    // ดึงข้อมูลผู้ใช้จาก SharedPreferences
    setState(() {
      // ดึงข้อมูลจาก SharedPreferences
      emailController.text = prefs!.getString('userEmail') ?? '';
      firstnameController.text = prefs!.getString('userFirstname') ?? '';
      lastnameController.text = prefs!.getString('userLastname') ?? '';
      phoneController.text = prefs!.getString('userPhone') ?? '';
      usernameController.text = prefs!.getString('userName') ?? '';
    });
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> userData) async {
    try {
      // URL สำหรับอัปเดตข้อมูลผู้ใช้
      final url = Uri.parse('https://ev-backend.logicton.com/api/update/users/$userId');

      final response = await http.put(
        url,
        body: jsonEncode(userData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // แสดงผลเมื่ออัปเดตข้อมูลสำเร็จ
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'แก้ไขข้อมูลเรียบร้อย!',
          confirmBtnText: "ตกลง",
          onConfirmBtnTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserList(
                  onSetThemeMode: (ThemeMode) {},
                ),
              ),
            );
          },
        );

        // บันทึกข้อมูลลง SharedPreferences
        prefs!.setString('userEmail', userData['email']);
        prefs!.setString('userFirstname', userData['Firstname']);
        prefs!.setString('userLastname', userData['Lastname']);
        prefs!.setString('userPhone', userData['Phone']);
        prefs!.setString('userName', userData['name']); // บันทึกชื่อผู้ใช้

      } else if (response.statusCode == 404) {
        // ไม่พบข้อมูลผู้ใช้
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'ไม่พบข้อมูลผู้ใช้',
          confirmBtnText: "ตกลง",
        );
      } else {
        // ข้อผิดพลาดอื่น ๆ
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'ไม่สามารถอัปเดตข้อมูลผู้ใช้ได้',
          confirmBtnText: "ตกลง",
        );
      }
    } catch (error) {
      // จัดการข้อผิดพลาด
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'เกิดข้อผิดพลาดในการอัปเดตข้อมูลผู้ใช้',
        confirmBtnText: "ตกลง",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: const Text(
          'แก้ไขข้อมูลส่วนตัว',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserList(
                  onSetThemeMode: (ThemeMode) {},
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                    radius: 80,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.edit,
                        color: const Color.fromARGB(255, 92, 116, 250),
                        size: 28,
                      ),
                      onSelected: (String value) {
                        // จัดการเมื่อเลือกเมนู Popup
                        if (value == 'edit_profile') {
                          // แก้ไขโปรไฟล์
                        } else if (value == 'change_picture') {
                          // เปลี่ยนรูปภาพ
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          value: 'edit_profile',
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person_outline,
                                color: const Color.fromARGB(255, 92, 116, 250),
                              ),
                              const SizedBox(width: 10),
                              const Text('แก้ไขโปรไฟล์'),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'change_picture',
                          child: Row(
                            children: [
                              const Icon(
                                Icons.photo_camera_outlined,
                                color: const Color.fromARGB(255, 92, 116, 250),
                              ),
                              const SizedBox(width: 10),
                              const Text('เปลี่ยนรูปภาพ'),
                            ],
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      elevation: 8,
                      offset: const Offset(0, 40),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '* อีเมล',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[200],
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    filled: true,
                    fillColor: Colors.indigo[50],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // เพิ่มช่องกรอกข้อมูลชื่อผู้ใช้
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '* ชื่อผู้ใช้',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[200],
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    filled: true,
                    fillColor: Colors.indigo[50],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '* ชื่อจริง',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[200],
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: firstnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 16,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                          filled: true,
                          fillColor: Colors.indigo[50],
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '* นามสกุล',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[200],
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: lastnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(
                            Icons.person_2,
                            size: 16,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                          filled: true,
                          fillColor: Colors.indigo[50],
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '* เบอร์โทรศัพท์',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[200],
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    filled: true,
                    fillColor: Colors.indigo[50],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    backgroundColor: const Color.fromARGB(255, 92, 116, 250),
                  ),
                  onPressed: () async {
                    try {
                      // ดึง userId จาก SharedPreferences ในรูปแบบ int
                      int? userId = prefs?.getInt('userId');
                      if (userId == null) {
                        // จัดการกรณีที่ไม่พบ userId
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'ไม่พบ userId ใน SharedPreferences',
                          confirmBtnText: "ตกลง",
                        );
                        return;
                      }

                      // แปลง userId เป็น String เพื่อใช้ในการส่ง API
                      String userIdString = userId.toString();

                      // ดึงข้อมูลจาก TextField
                      String email = emailController.text;
                      String firstname = firstnameController.text;
                      String lastname = lastnameController.text;
                      String phone = phoneController.text;
                      String username = usernameController.text; // ดึงชื่อผู้ใช้

                      // สร้าง Map สำหรับอัปเดตข้อมูลผู้ใช้
                      Map<String, dynamic> userData = {
                        'email': email,
                        'Firstname': firstname,
                        'Lastname': lastname,
                        'Phone': phone,
                        'name': username, // เพิ่มชื่อผู้ใช้ในแผนที่
                      };

                      // เรียกใช้ฟังก์ชัน updateUserData ด้วย userIdString และ userData
                      await updateUserData(userIdString, userData);
                    } catch (error) {
                      // พิมพ์ข้อผิดพลาดไปที่ terminal
                      print('เกิดข้อผิดพลาด: $error');

                      // แสดง QuickAlert เมื่อเกิดข้อผิดพลาด
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: 'เกิดข้อผิดพลาดในการอัปเดตข้อมูลผู้ใช้',
                        confirmBtnText: "ตกลง",
                      );
                    }
                  },
                  child: const Text(
                    'บันทึกข้อมูล',
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
