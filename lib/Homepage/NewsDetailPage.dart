import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ev_appcharger/History/HistoryList.dart';
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:ev_appcharger/Homepage/Scanqrcode.dart';
import 'package:ev_appcharger/Map/Map.dart';
import 'package:ev_appcharger/User/UserList.dart';

// หน้าสำหรับแสดงรายละเอียดข่าว
class NewsDetailPage extends StatelessWidget {
  final int newId;

  NewsDetailPage({required this.newId});

  Future<Map<String, dynamic>> fetchNewsDetail() async {
    final response = await http.get(
      Uri.parse('https://ev-backend.logicton.com/api/latestnews/$newId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load news detail. HTTP status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดข่าว'),
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Homepage1(),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchNewsDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final newsData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsData['Title'],
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      newsData['Detail'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    // คุณสามารถเพิ่มองค์ประกอบอื่น ๆ เช่น รูปภาพหรือวิดีโอที่นี่
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // ฟังก์ชันสำหรับนำทางไปยังหน้าต่าง ๆ
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
              newPage = UserList(onSetThemeMode: (ThemeMode mode) { /* Handle theme mode */ },);
              break;
            default:
              newPage = Homepage1();
              break;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => newPage),
          );
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
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        selectedItemColor: const Color.fromARGB(255, 92, 116, 250),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
