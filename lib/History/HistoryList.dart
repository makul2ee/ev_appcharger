
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:ev_appcharger/Homepage/Scanqrcode.dart';
import 'package:ev_appcharger/Map/Map.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  int _currentIndex = 3;
  int selectedIndex = 0;
  DateTime? selectedDate;
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
  final List<Map<String, dynamic>> chargeData = [
    {
      'place': 'สถานที่ A',
      'time': '12.00 น. - 14.00 น.',
      'percentage': 80,
      'date': '01/01/2024'
    },
    {
      'place': 'Burisriping riverside',
      'time': '10.00 น. - 10.15 น.',
      'percentage': 20,
      'date': '03/01/2024'
    },
    {
      'place': 'โรงแรมกาสะลอง',
      'time': '23.00 น. - 07.00 น.',
      'percentage': 70,
      'date': '03/01/2024'
    },
  ];

  final List<Map<String, dynamic>> bookingData = [
    {
      'place': 'สถานที่ B',
      'time': '15.00 น. - 16.00 น.',
      'status': 'จองเสร็จสิ้น',
      'date': '01/01/2024'
    },
    {
      'place': 'River Park',
      'time': '09.00 น. - 09.30 น.',
      'status': 'รอการยืนยัน',
      'date': '03/01/2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ประวัติ', textAlign: TextAlign.center),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FlutterToggleTab(
              selectedIndex: selectedIndex,
              width: 100,
              borderRadius: 10,
              height: 40,
              selectedBackgroundColors: [
                const Color.fromARGB(255, 92, 116, 250)
              ],
              unSelectedBackgroundColors: [Colors.white],
              selectedTextStyle: TextStyle(color: Colors.white),
              unSelectedTextStyle: TextStyle(
                color: Colors.black,
              ),
              labels: ["ข้อมูลการชาร์จ", "ข้อมูลการจอง"],
              selectedLabelIndex: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: const Color.fromARGB(255, 92, 116, 250),
                          onPrimary: Colors.white,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              controller: TextEditingController(
                text: selectedDate != null
                    ? DateFormat('dd MMMM yyyy', 'th').format(selectedDate!)
                    : '',
              ),
              decoration: InputDecoration(
                labelText: 'เลือกวันเดือนปี',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 31, 31, 31),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 209, 209, 209),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 240, 238, 238),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: const Color.fromARGB(255, 92, 116, 250),
                    size: 16,
                  ),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: const Color.fromARGB(255, 92, 116, 250),
                              onPrimary: Colors.white,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: selectedIndex == 0
                  ? ListView.builder(
                      itemCount: chargeData.length,
                      itemBuilder: (context, index) {
                        try {
                          DateTime chargeDate = DateFormat('MM/dd/yyyy')
                              .parse(chargeData[index]['date']);
                          if (selectedDate != null &&
                              chargeDate.isAtSameMomentAs(selectedDate!)) {
                            return Card(
                              child: ListTile(
                                leading: Icon(
                                  Icons.electric_car,
                                  color: Color.fromARGB(255, 92, 116, 250),
                                ),
                                title: Text(
                                  '${chargeData[index]['place']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'เวลา: ${chargeData[index]['time']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'ชาร์จทั้งหมด: ${chargeData[index]['percentage']}%',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ), // เพิ่มช่องว่างระหว่างข้อความและไอคอน
                                        Icon(
                                          Icons.play_arrow,
                                          size: 14,
                                          color: Color.fromARGB(
                                              255, 92, 116, 250),
                                        ), // เพิ่มไอคอน play_arrow ที่นี่
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Invalid date format in chargeData');
                        }
                        return SizedBox();
                      },
                    )
                  : ListView.builder(
                      itemCount: bookingData.length,
                      itemBuilder: (context, index) {
                        try {
                          DateTime bookingDate = DateFormat('MM/dd/yyyy')
                              .parse(bookingData[index]['date']);
                          if (selectedDate != null &&
                              bookingDate.isAtSameMomentAs(selectedDate!)) {
                            return Card(
                              child: ListTile(
                                leading: Icon(
                                  Icons.bookmark,
                                  color: Color.fromARGB(255, 92, 116, 250),
                                ),
                                title: Text(
                                  '${bookingData[index]['place']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'เวลา: ${bookingData[index]['time']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      'สถานะ: ${bookingData[index]['status']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Invalid date format in bookingData');
                        }
                        return SizedBox();
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

