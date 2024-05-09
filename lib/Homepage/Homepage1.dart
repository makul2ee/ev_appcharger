import 'package:ev_appcharger/History/HistoryList.dart';
import 'package:ev_appcharger/Homepage/NewsDetailPage.dart';
import 'package:ev_appcharger/Homepage/Scanqrcode.dart';
import 'package:ev_appcharger/Map/Map.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';


// คลาสสำหรับเก็บข้อมูลข่าว
class NewsItem {
  final int newId;
  final String title;
  final String detail;

  NewsItem({required this.newId, required this.title, required this.detail});

  // ฟังก์ชันสำหรับแปลง JSON เป็น NewsItem
  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      newId: json['NewID'],
      title: json['Title'],
      detail: json['Detail'],
    );
  }
}

class Homepage1 extends StatefulWidget {
  @override
  _Homepage1State createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  int _currentIndex = 0; // ตัวแปรเก็บสถานะของแท็บปัจจุบัน

  // ฟังก์ชันสำหรับเรียกข้อมูลข่าวจาก API
  Future<List<NewsItem>> fetchLatestNews() async {
    final response = await http.get(
      Uri.parse('https://ev-backend.logicton.com/api/latestnews'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => NewsItem.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text(
          'EV APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // เพิ่มโค้ดที่ต้องการให้ทำงานเมื่อกดปุ่ม icon ที่นี่
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 240, 237, 237),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ใช้ FlutterCarousel สำหรับแบนเนอร์
              SizedBox(height: 15),
              FlutterCarousel(
                items: [
                  _buildImageContainer("images/3.jpg"),
                  _buildImageContainer("images/4.jpg"),
                  _buildImageContainer("images/5.jpg"),
                  _buildImageContainer("images/EV5.png"),
                ],
                options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  slideIndicator: CircularWaveSlideIndicator(
                    indicatorRadius: 4.0,
                    currentIndicatorColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'แบรนด์รถยนต์ EV',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  color: Color.fromARGB(255, 196, 196, 196),
                  child: SizedBox(
                    height: 120,
                    child: FlutterCarousel(
                      options: CarouselOptions(
                        height: 120,
                        viewportFraction: 0.3,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        slideIndicator: CircularWaveSlideIndicator(
                          indicatorRadius: 4.0,
                          currentIndicatorColor: Colors.white,
                        ),
                      ),
                      items: [
                        _buildCarBrandCard('images/Hyundai.png', 'Hyundai', 'https://www.hyundai.com'),
                        _buildCarBrandCard('images/KIA.png', 'KIA', 'https://www.kia.com'),
                        _buildCarBrandCard(
                            'images/Mercedes-Benz.png', 'Mercedes-Benz', 'https://www.mercedes-benz.com'),
                        _buildCarBrandCard('images/MG.png', 'MG', 'https://www.mgmotor.com'),
                        _buildCarBrandCard('images/Tesla_logo.png', 'Tesla', 'https://www.tesla.com'),
                        _buildCarBrandCard(
                            'images/Volkswagen.png', 'Volkswagen', 'https://www.volkswagen.com'),
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
                    'ข่าวมาแรง',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                ),
              ),
              // ดึงและแสดงผลข้อมูลข่าวในหน้า Homepage1
              FutureBuilder<List<NewsItem>>(
                future: fetchLatestNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error loading news'));
                  } else {
                    final newsItems = snapshot.data ?? [];
                    return Column(
                      children: newsItems
                          .map((newsItem) => _buildNewsCard(context, newsItem))
                          .toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        selectedItemColor: const Color.fromARGB(255, 92, 116, 250),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // ฟังก์ชันสร้าง Container สำหรับรูปภาพใน Carousel
  Widget _buildImageContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent, // กำหนดสีของ border ให้โปร่งใส
          width: 2.0, // กำหนดความหนาของ border
        ),
        borderRadius: BorderRadius.circular(8.0), // ปรับให้มุมของรูปภาพโค้งมน
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0), // ปรับให้มุมของรูปภาพโค้งมน
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างการ์ดสำหรับแสดงแบรนด์รถยนต์
  Widget _buildCarBrandCard(String imagePath, String brandName, String brandUrl) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(brandUrl)) {
          await launch(brandUrl);
        } else {
          // หากไม่สามารถเปิด URL ได้ ให้แสดงข้อความแจ้งเตือน
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('ไม่สามารถเปิด URL ได้')),
          );
        }
      },
      child: Container(
        width: 120,
        height: 50, // ปรับความสูงของ Container ตามความเหมาะสม
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 237, 237),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 60, // ปรับความสูงของรูปภาพ
              width: 90,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 6), // เพิ่มช่องว่างระหว่างภาพและชื่อแบรนด์
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, NewsItem newsItem) {
    // จำกัดความยาวของ Detail ใน Card ที่ 300 ตัวอักษร
    String detailText = newsItem.detail;
    if (detailText.length > 300) {
      detailText = detailText.substring(0, 300) + '...';
    }

    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          title: Text(
            newsItem.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 92, 116, 250),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8), // เพิ่มช่องว่างระหว่าง title และ detail
              Text(
                detailText,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(newId: newsItem.newId),
                    ),
                  );
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                ),
                child: Text(
                  'ดูเพิ่มเติม...',
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันนำทางไปยังหน้าอื่น ๆ ตาม index ที่ระบุ
  void _navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage1()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GPSMap()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Scanqrcode()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HistoryList()),
        );
        break;
       case 4:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UserList(
                        onSetThemeMode: (ThemeMode themeMode) {
                            // ฟังก์ชัน onSetThemeMode จะถูกเรียกเมื่อโหมดธีมเปลี่ยนแปลง
                            // ดำเนินการกับ themeMode ตามต้องการ เช่น อาจอัปเดต state ของโหมดธีม
                            // หรือทำการบันทึกการตั้งค่าธีมใหม่
                            // คุณสามารถใช้ setState() หรือโค้ดอื่นๆ ใน MyAppState เพื่อปรับเปลี่ยนธีม
                        },
                    ),
                ),
            );
            break;
    }
  }
}
