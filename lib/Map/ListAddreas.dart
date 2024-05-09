import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListAddreas extends StatefulWidget {
  @override
  _ListAddreasState createState() => _ListAddreasState();
}

class _ListAddreasState extends State<ListAddreas> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String _status = 'available';
  String _status2 = 'reserved';
  String _status3 = 'in_use';
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text(
          'รายละเอียดสถานี',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/5.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ชื่อสถานที่ : Burisriping riverside',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '1.2 กม. | 20 นาที',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 32, 16),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    isFollowed = !isFollowed;
                  });
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: isFollowed ? Colors.red : Colors.green),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: isFollowed ? Colors.red : Colors.green,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      isFollowed ? 'ติดตามแล้ว' : 'ติดตาม',
                      style: TextStyle(
                        fontSize: 11,
                        color: isFollowed ? Colors.red : Colors.green,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      softWrap: false,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.gps_fixed,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ที่อยู่ : ถนน ห้วยแก้ว เชียงใหม่ 50100',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'เบอร์โทรศัพท์ : 012-345-6789',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'เปิดให้บริการ เวลา : 09.00 น. - 18.00 น.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildButton(context, "ดูรายละเอียด", Icons.electric_car,
                onPressed: () {
              // Implement onPressed action
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatusIndicator(_status),
                  Text('ว่าง :'),
                  _buildStatusIndicator(_status2),
                  Text('จอง :'),
                  _buildStatusIndicator(_status3),
                  Text('กำลังใช้งาน :')
                ],
              ),
            ),
            _buildButton(context, "หัวชาร์จ AC (Type 1)", Icons.ac_unit,
                status: _status, onPressed: () {
              // Check status and show dialog for booking if available
              if (_status == 'available') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('จองหัวชาร์จ', textAlign: TextAlign.center),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildButton(
                              context,
                              "หัวชาร์จ AC (Type 1)",
                              Icons.ac_unit,
                              onPressed: () {
                                // Implement onPressed action
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'เลือกวัน เดือน ปี',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: Color.fromARGB(255, 92, 116, 250)),
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 210, 210),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              readOnly: true,
                              controller: _dateController,
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'เลือกเวลา',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 92, 116, 250),
                                  ),
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 210, 210),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              readOnly: true,
                              controller: _timeController,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ยกเลิก'),
                          style: TextButton.styleFrom(
                            primary: Colors.grey, // สีข้อความเป็นสีเทา
                            backgroundColor:
                                Colors.white, // สีพื้นหลังเป็นสีขาว
                            minimumSize: Size(120, 40), // ขนาดของปุ่ม
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ยืนยัน'),
                          style: TextButton.styleFrom(
                            primary: Colors.white, // สีข้อความเป็นสีขาว
                            backgroundColor: Colors.blue, // สีพื้นหลังเป็นสีฟ้า
                            minimumSize: Size(120, 40), // ขนาดของปุ่ม
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Show dialog for unavailable status
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('ไม่สามารถจองได้'),
                      content: Text('สถานะไม่ว่าง กรุณาเลือกสถานะที่ว่าง'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical:
                              20), // ปรับความกว้างของเนื้อหาใน AlertDialog
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'ตกลง',
                            style: TextStyle(
                              color:
                                  Colors.red, // กำหนดสีข้อความของปุ่มเป็นสีแดง
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                                100, 40), // กำหนดความกว้างและความสูงของปุ่ม
                            side: BorderSide(
                              color: Colors.red, // กำหนดสีขอบของปุ่มเป็นสีแดง
                              width: 2, // กำหนดความหนาของเส้นขอบของปุ่ม
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            }),
            _buildButton(context, "หัวชาร์จ AC (Type 2)", Icons.ac_unit_sharp,
                status: _status2, onPressed: () {
              // Check status and show dialog for booking if available
              if (_status2 == 'available') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('จองหัวชาร์จ'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildButton(
                            context,
                            "หัวชาร์จ AC (Type 1)",
                            Icons.ac_unit,
                            onPressed: () {
                              // Implement onPressed action
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'เลือกวัน เดือน ปี',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today,
                                    color: Color.fromARGB(255, 92, 116, 250)),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 211, 210, 210),
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            readOnly: true,
                            controller: _dateController,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'เลือกเวลา',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.access_time,
                                  color: Color.fromARGB(255, 92, 116, 250),
                                ),
                                onPressed: () {
                                  _selectTime(context);
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 211, 210, 210),
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            readOnly: true,
                            controller: _timeController,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ยกเลิก'),
                          style: TextButton.styleFrom(
                            primary: Colors.grey, // สีข้อความเป็นสีเทา
                            backgroundColor:
                                Colors.white, // สีพื้นหลังเป็นสีขาว
                            minimumSize: Size(120, 40), // ขนาดของปุ่ม
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ยืนยัน'),
                          style: TextButton.styleFrom(
                            primary: Colors.white, // สีข้อความเป็นสีขาว
                            backgroundColor: Colors.blue, // สีพื้นหลังเป็นสีฟ้า
                            minimumSize: Size(120, 40), // ขนาดของปุ่ม
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Show dialog for unavailable status
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('ไม่สามารถจองได้'),
                      content: Text('สถานะไม่ว่าง กรุณาเลือกสถานะที่ว่าง'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical:
                              20), // ปรับความกว้างของเนื้อหาใน AlertDialog
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'ตกลง',
                            style: TextStyle(
                              color:
                                  Colors.red, // กำหนดสีข้อความของปุ่มเป็นสีแดง
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                                100, 40), // กำหนดความกว้างและความสูงของปุ่ม
                            side: BorderSide(
                              color: Colors.red, // กำหนดสีขอบของปุ่มเป็นสีแดง
                              width: 2, // กำหนดความหนาของเส้นขอบของปุ่ม
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            }),
            _buildButton(
              context,
              "หัวชาร์จ AC (Type Tesla)",
              Icons.electric_car_rounded,
              status: _status3,
              onPressed: () {
                // Check status and show dialog for booking if available
                if (_status3 == 'available') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('จองหัวชาร์จ'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildButton(
                              context,
                              "หัวชาร์จ AC (Type 1)",
                              Icons.ac_unit,
                              onPressed: () {
                                // Implement onPressed action
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'เลือกวัน เดือน ปี',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: Color.fromARGB(255, 92, 116, 250)),
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 210, 210),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              readOnly: true,
                              controller: _dateController,
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'เลือกเวลา',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 92, 116, 250),
                                  ),
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 211, 210, 210),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              readOnly: true,
                              controller: _timeController,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ยกเลิก'),
                            style: TextButton.styleFrom(
                              primary: Colors.grey, // สีข้อความเป็นสีเทา
                              backgroundColor:
                                  Colors.white, // สีพื้นหลังเป็นสีขาว
                              minimumSize: Size(120, 40), // ขนาดของปุ่ม
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ยืนยัน'),
                            style: TextButton.styleFrom(
                              primary: Colors.white, // สีข้อความเป็นสีขาว
                              backgroundColor:
                                  Colors.blue, // สีพื้นหลังเป็นสีฟ้า
                              minimumSize: Size(120, 40), // ขนาดของปุ่ม
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Show dialog for unavailable status
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('ไม่สามารถจองได้'),
                        content: Text('สถานะไม่ว่าง กรุณาเลือกสถานะที่ว่าง'),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical:
                                20), // ปรับความกว้างของเนื้อหาใน AlertDialog
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'ตกลง',
                              style: TextStyle(
                                color: Colors
                                    .red, // กำหนดสีข้อความของปุ่มเป็นสีแดง
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(
                                  100, 40), // กำหนดความกว้างและความสูงของปุ่ม
                              side: BorderSide(
                                color: Colors.red, // กำหนดสีขอบของปุ่มเป็นสีแดง
                                width: 2, // กำหนดความหนาของเส้นขอบของปุ่ม
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status) {
    Color color;
    switch (status) {
      case 'available':
        color = Colors.green;
        break;
      case 'reserved':
        color = Colors.yellow;
        break;
      case 'in_use':
        color = Colors.red;
        break;
      default:
        color = Colors.transparent;
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    IconData iconData, {
    String? status,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color.fromARGB(255, 226, 227, 228),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (status != null) _buildStatusIndicator(status),
                if (status != null) SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    iconData,
                    size: 18,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
                SizedBox(width: status != null ? 10 : 0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
              child: Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // อัพเดตค่าใน Textfield
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        // อัพเดตค่าใน Textfield
        _timeController.text = selectedTime!.format(context);
      });
    }
  }

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
}

class FollowButton extends StatefulWidget {
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 32, 8),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            isFollowed = !isFollowed;
          });
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: isFollowed ? Colors.green : Colors.red),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border,
              color: isFollowed ? Colors.green : Colors.red,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              isFollowed ? 'ติดตามแล้ว' : 'ติดตาม',
              style: TextStyle(
                fontSize: 11,
                color: isFollowed ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              maxLines: 1,
              softWrap: false,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ],
        ),
      ),
    );
  }
}
