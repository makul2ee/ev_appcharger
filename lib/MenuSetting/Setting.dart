import 'dart:convert';
import 'package:ev_appcharger/Login/Login_Screen.dart';
import 'package:ev_appcharger/MenuSetting/Requirements.dart';
import 'package:ev_appcharger/MenuSetting/lawSetting.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool receiveNotification = false;
  String selectedLanguage = "ไทย";

  void _setLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  Future<void> _deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';

    final url = Uri.parse('http://localhost:3000/users/$userId');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);
        int userStatus = userData['status'];

        if (userStatus == 0) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            text: 'บัญชีนี้ถูกลบไปแล้ว',
          );
        } else {
          final deleteResponse = await http.delete(
            url,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
          );

          if (deleteResponse.statusCode == 200) {
            // Clear user data from SharedPreferences
            await prefs.clear();

            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'ลบผู้ใช้งานสำเร็จ',
            );

            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          } else {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'ไม่สามารถลบบัญชีผู้ใช้งานได้',
            );
          }
        }
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้',
        );
      }
    } catch (error) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้',
      );
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all user data
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  Widget _buildButton(BuildContext context, String text, Widget trailingWidget,
      {double containerPadding = 12.0, Color textColor = Colors.black}) {
    return InkWell(
      onTap: () {
        if (text == "เลือกภาษา") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(
                  child: Text(
                    'เลือกภาษา',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 92, 116, 250),
                      fontSize: 16,
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ไทย',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          _setLanguage('ไทย');
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'English',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          _setLanguage('English');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              );
            },
          );
        } else if (text == "ลบบัญชี") {
          PanaraConfirmDialog.show(
            context,
            title: "ลบบัญชี",
            message: "คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีนี้",
            confirmButtonText: "ยืนยัน",
            cancelButtonText: "ยกเลิก",
            textColor: Colors.red,
            onTapCancel: () {
              Navigator.pop(context);
            },
            onTapConfirm: () {
              _deleteUser();
             Navigator.pop(context);
            },
            panaraDialogType: PanaraDialogType.error,
            barrierDismissible:
                false, // ตัวเลือกไม่บังคับ (ค่าเริ่มต้นคือ true)
          );
        } else if (text == "ลงชื่อออก") {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            title: 'ลงชื่อออกจากระบบ',
            text: 'คุณต้องการลงชื่อออกจากระบบหรือไม่?',
            confirmBtnText: 'ใช่',
            cancelBtnText: 'ไม่',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              _logout();
              Navigator.of(context).pop();
            },
            onCancelBtnTap: () {
              Navigator.of(context).pop();
            },
          );
        } else {
          // Add other onTap actions here
        }
      },
      child: Container(
        padding: EdgeInsets.all(containerPadding),
        margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                color: textColor,
              ),
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text(
          'การตั้งค่า',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => UserList(onSetThemeMode: (ThemeMode ) {  },),
            ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่าทั่วไป',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0),
            _buildButton(
              context,
              "เลือกภาษา",
              Row(
                children: [
                  Text(
                    selectedLanguage,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'ตั้งค่าการแจ้งเตือน',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildButton(
              context,
              "รับการแจ้งเตือน",
              Switch(
                value: receiveNotification,
                onChanged: (value) {
                  setState(() {
                    receiveNotification = value;
                  });
                },
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
              containerPadding: 4.0,
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'กฏหมาย',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildButton(
              context,
              "นโยบายและความเป็นส่วนตัว",
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LawSetting(),
                  ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            SizedBox(height: 8),
            _buildButton(
              context,
              "ข้อกำหนดและเงื่อนไข",
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Requirements(),
                  ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'บัญชี',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildButton(
              context,
              "ลบบัญชี",
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 16,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              textColor: Colors.red,
            ),
            SizedBox(height: 8),
            _buildButton(
              context,
              "ลงชื่อออก",
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 16,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
          ],
        ),
      ),
    );
  }
}
