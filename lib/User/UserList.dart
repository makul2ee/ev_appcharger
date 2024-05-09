
import 'package:ev_appcharger/Coupon/CouponList.dart';
import 'package:ev_appcharger/History/HistoryList.dart';
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:ev_appcharger/Homepage/Scanqrcode.dart';
import 'package:ev_appcharger/Login/Login_Screen.dart';
import 'package:ev_appcharger/Map/Map.dart';
import 'package:ev_appcharger/Menu%20Electric%20Car/ElectricCarList.dart';
import 'package:ev_appcharger/Menu%20Tax%20invoice/TaxInvoiceList.dart';
import 'package:ev_appcharger/MenuSetting/Requirements.dart';
import 'package:ev_appcharger/MenuSetting/lawSetting.dart';
import 'package:ev_appcharger/Payment/PaymentList.dart';
import 'package:ev_appcharger/User/ChangePassword.dart';
import 'package:ev_appcharger/User/Changedatauser.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:panara_dialogs/panara_dialogs.dart';

class UserList extends StatefulWidget {

   final Function(ThemeMode) onSetThemeMode; // ฟังก์ชันสำหรับสลับธีม
    UserList({required this.onSetThemeMode});
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  
  bool receiveNotification = false;
  String selectedLanguage = "ไทย";
  int _currentIndex = 4;
  String _name = ''; // แก้ไขเป็น name
  bool isDarkMode = false; // ตัวแปรสำหรับจัดการโหมด Dark Mode หรือ Light Mode

  @override
  void initState() {
    super.initState();
    getUserData();
    loadDarkModePreference(); // เรียกใช้ฟังก์ชันเพื่อตรวจสอบค่า Dark Mode จาก SharedPreferences
  }

  void _setLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

 Future<void> loadDarkModePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      isDarkMode = darkMode;
    });
  }

  Future<void> saveDarkModePreference(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', darkMode);
  }

   void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
      widget.onSetThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      saveDarkModePreference(isDarkMode);
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

  Future<void> getUserData() async {
    try {
      // ใช้ SharedPreferences เพื่อเข้าถึงข้อมูลที่เก็บไว้
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // ดึงชื่อผู้ใช้จาก SharedPreferences
      String? userName = prefs.getString('userName');

      // ตรวจสอบว่าชื่อผู้ใช้มีค่าไม่เป็น null
      if (userName != null) {
        // print('Name retrieved from SharedPreferences: $userName');

        // ตั้งค่า state เพื่ออัพเดตชื่อผู้ใช้
        setState(() {
          _name = userName;
        });
      } else {
        // แสดงข้อความในกรณีที่ไม่มีข้อมูลชื่อผู้ใช้ใน SharedPreferences
      }
    } catch (error) {
      // จัดการกับข้อผิดพลาดที่เกิดขึ้น
      print("Error getting user data: $error");
      _showErrorSnackBar("ไม่สามารถเรียกข้อมูลผู้ใช้ได้");
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _navigateToPage(int index, BuildContext context) {
    Widget newPage;
    switch (index) {
      case 0:
        newPage = Homepage1();
        break;
      case 1:
        newPage = GPSMap();
        break;
      case 2:
        newPage = Scanqrcode();
        break;
      case 3:
        newPage = HistoryList();
        break;
      case 4:
        newPage = UserList(onSetThemeMode: (ThemeMode ) {  },);
        break;
      default:
        newPage = Homepage1();
        break;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

  Widget _listTitleButton(
    BuildContext context,
    String text,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 0.5, // ลดค่า elevation ให้เล็กลง
      margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0), // ลดค่า margin เพื่อทำให้ขนาด card เล็กลง
      child: ListTile(
        leading: Icon(
          iconData,
          size: 20.0, // ลดขนาดของไอคอน
          color: Color.fromARGB(255, 92, 116, 250),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16.0, // ลดขนาดของข้อความ
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.0, // ลดขนาดของไอคอน
          color: Colors.grey,
        ),
        onTap: onPressed,
      ),
    );
  }

  Widget _listTitleButton2(
    BuildContext context,
    String text,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 0.5, // ลดค่า elevation ให้เล็กลง
      margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0), // ลดค่า margin เพื่อทำให้ขนาด card เล็กลง
      child: ListTile(
        leading: Icon(
          iconData,
          size: 20.0, // ลดขนาดของไอคอน
          color: Color.fromARGB(255, 92, 116, 250),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16.0, // ลดขนาดของข้อความ
            color: Colors.black,
          ),
        ),
        trailing: Switch(
          value: receiveNotification,
          onChanged: (value) {
            setState(() {
              receiveNotification = value;
            });
          },
        ),
        onTap: onPressed,
      ),
    );
  }

  Widget _listTitleButton3(
    BuildContext context,
    String text,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 0.5, // ลดค่า elevation ให้เล็กลง
      margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0), // ลดค่า margin เพื่อทำให้ขนาด card เล็กลง
      child: ListTile(
        leading: Icon(
          iconData,
          size: 20.0, // ลดขนาดของไอคอน
          color: Colors.red,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16.0, // ลดขนาดของข้อความ
            color: Colors.red,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.0, // ลดขนาดของไอคอน
          color: Colors.red,
        ),
        onTap: () {
          // เมื่อทำการคลิกที่ ListTile
          // แสดง QuickAlert แบบ warning
          PanaraConfirmDialog.show(
            context,
            title: "ลบบัญชี",
            message: 'ยืนยันที่จะลบบัญชีหรือไม่?',
            confirmButtonText: 'ยืนยัน',
            cancelButtonText: 'ยกเลิก',
            textColor: Colors.red,
            onTapConfirm: () {
              // หากคลิกปุ่ม "ใช่"
              // ดำเนินการต่อ
              onPressed();
              _deleteUser();
              Navigator.pop(context); // ปิด QuickAlert
            },
            onTapCancel: () {
              // หากคลิกปุ่ม "ไม่ใช่" ก็เพียงแค่ปิด QuickAlert
              Navigator.pop(context);
            },
            panaraDialogType: PanaraDialogType.error,
            barrierDismissible: false,
          );
        },
      ),
    );
  }

  Widget _listTitleButton4(
    BuildContext context,
    String text,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 0.5, // ลดค่า elevation ให้เล็กลง
      margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0), // ลดค่า margin เพื่อทำให้ขนาด card เล็กลง
      child: ListTile(
          leading: Icon(iconData,
              size: 20.0, // ลดขนาดของไอคอน
              color: Color.fromARGB(255, 92, 116, 250)),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16.0, // ลดขนาดของข้อความ
              color: Colors.black,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.0, // ลดขนาดของไอคอน
            color: Colors.grey,
          ),
          onTap: () {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                title: 'ออกจากกระบบ',
                text: 'คุณต้องการออกจากระบบหรือไม่?',
                confirmBtnText: 'ออกจากระบบ',
                cancelBtnText: 'ยกเลิก',
                confirmBtnColor: Colors.red,
                onConfirmBtnTap: () {
                  onPressed();
                  _logout();
                  Navigator.pop(context);
                },
                onCancelBtnTap: () {
                  Navigator.pop(context);
                });
          }),
    );
  }
  //ส่วนของ logout ผ่านจาก LocalStorage หรือ Session

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
  backgroundColor: isDarkMode ? Colors.grey[900] : const Color.fromARGB(255, 92, 116, 250),
  expandedHeight: 100,
  pinned: true,
  title: Text(
    'การตั้งค่า',
    textAlign: TextAlign.left,
    style: TextStyle(
      color: isDarkMode ? Colors.white : Colors.black, // ปรับสีของข้อความตาม Dark Mode
    ),
  ),
  actions: [
    IconButton(
      icon: Icon(
        isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
        color: Colors.white,
      ),
      onPressed: _toggleDarkMode,
    ),
  ],
),
            SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // ส่วนของการแสดงข้อมูลของผู้ใช้
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        color: Color.fromARGB(
                            255, 240, 237, 237), // เพิ่มสีพื้นหลังที่ต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // กำหนดรัศมีมุมให้กลม
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              8.0), // เพิ่ม padding ภายใน Card
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/profile.png'),
                                    radius: 40,
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ผู้ใช้:',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    _name, // แสดงชื่อของผู้ใช้
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ข้อมูลของผู้ใช้',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ),
                      ),
                    ),
                    _listTitleButton(
                      context,
                      'แก้ไขข้อมูลส่วนตัว',
                      Icons.person,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Changedatauser(),
                          ),
                        );
                      },
                    ),
                    _listTitleButton(
                      context,
                      'เปลี่ยนรหัสผ่าน',
                      Icons.lock,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                      },
                    ),
                    _listTitleButton(
                      context,
                      'คูปองของฉัน',
                      Icons.card_giftcard,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CouponList(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'การชำระเงิน',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ),
                      ),
                    ),
                    _listTitleButton(
                      context,
                      'การชำระเงิน',
                      Icons.payment,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => PaymentList(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ข้อมูลทั่วไป',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ),
                      ),
                    ),
                    _listTitleButton(
                      context,
                      'ข้อมูลรถไฟฟ้า',
                      Icons.directions_car,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ElectricCarList(),
                          ),
                        );
                      },
                    ),
                    _listTitleButton(
                      context,
                      'ข้อมูลใบกำกับภาษี',
                      Icons.receipt,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => TaxInvoiceList(),
                          ),
                        );
                      },
                    ),
                    _listTitleButton(
                      context,
                      'นโยบายและความเป็นส่วนตัว',
                      Icons.receipt,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LawSetting(),
                          ),
                        );
                      },
                    ),
                    _listTitleButton(
                      context,
                      'ข้อกำหนดและเงื่อนไข',
                      Icons.request_page,
                      () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Requirements(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ตั้งค่าทั่วไป',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ),
                      ),
                    ),
                    _listTitleButton(
                      context,
                      'ภาษา (Languages)',
                      Icons.language,
                      () {},
                    ),
                    _listTitleButton2(
                      context,
                      'เปิดการแจ้งเตือน',
                      Icons.notifications,
                      () {},
                    ),
                    _listTitleButton3(context, 'ลบบัญชี', Icons.delete, () {}
                        // เรียกใช้งานฟังก์ชัน _deleteUser เมื่อปุ่มถูกกด
                        ),
                    //เพิ่มเติมส่วน Api ลบบัญชี
                    _listTitleButton4(
                      context,
                      'ออกจากระบบ',
                      Icons.logout,
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: Duration(milliseconds: 300), // กำหนดระยะเวลาของอนิเมชั่น
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: BottomNavigationBar(
          key: ValueKey<int>(_currentIndex), // ใช้ Key เพื่อระบุการเปลี่ยนแท็บ
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _navigateToPage(index, context);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'แผนที่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'สแกนQr',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'ประวัติ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'การตั้งค่า',
            ),
          ],
          backgroundColor:
              const Color.fromARGB(255, 92, 116, 250), // กำหนดสีพื้นหลัง
          selectedItemColor: const Color.fromARGB(
              255, 92, 116, 250), // กำหนดสีของไอเท็มที่เลือก
          unselectedItemColor: Colors.grey, // กำหนดสีของไอเท็มที่ไม่ได้เลือก
        ),
      ),
    );
  }
}
