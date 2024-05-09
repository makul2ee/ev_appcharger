
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:flutter/material.dart';

class SuccessCheckIn extends StatefulWidget {
  @override
  _SuccessCheckInState createState() => _SuccessCheckInState();
}

class _SuccessCheckInState extends State<SuccessCheckIn> {
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
                Icon(iconData),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Text(
                "เวลา : 10.25 น.",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton2(
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
                Icon(iconData, size: 16),
                SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Icon(Icons.money, size: 16),
            SizedBox(
              child: Text(
                " 750 Bath / kWh - hour",
                style: TextStyle(fontSize: 12.0),
              ),
            )
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
          'เสร็จสิ้น',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage1()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            _buildButton(
              context,
              "Burisriping riverside",
              Icons.electric_car,
              onPressed: () {
                // Implement onPressed action
              },
            ),
            SizedBox(height: 5.0),
            _buildButton2(
              context,
              "AC (Type 1 : ....kWh)",
              Icons.ac_unit,
              onPressed: () {
                // Implement onPressed action
              },
            ),
            SizedBox(height: 10.0),
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
                          Icons.electric_car,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'รถ : Build Your Dream ATTo 3 (กม.2076)',
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
                          Icons.payment,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'จ่ายเงิน : Ev Station Pay',
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
                          Icons.gif_box_outlined,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'คูปอง : ไม่มี',
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
                          Icons.start,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'เริ่มชาร์จ : 07 ม.ค. 2567 เวลา 10:00:00 hr.',
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
                          Icons.stop,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'หยุดชาร์จ : 07 ม.ค. 2567 เวลา 10:15:00 hr.',
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
                          Icons.gif_box_outlined,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'คูปอง : ไม่มี',
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
                          Icons.punch_clock,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'เวลาที่ใช้ในการชาร์จ : 00.15.00 hr.',
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
                          Icons.electric_car,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'พลังงานที่ใช้ในการชาร์จ : 5.4 kWh-hr.',
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
                          Icons.gps_fixed,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ระบบทางโดยประมาณ : 40.80 km.',
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
                          Icons.payments,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'เรียกเก็บค่าบริการ : 40.50 Bath',
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
                          Icons.padding_sharp,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ภาษีมูลค่าเพิ่ม : 2.65 Bath',
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
                          Icons.gif_box_outlined,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ยอดรวมก่อนภาษีมูลค่าเพิ่ม : 37.85 Bath',
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
                          Icons.gif_box_outlined,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ราคารวมทั้งหมด : 40.50 Bath',
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'ชำระเงินเรียบร้อยแล้ว',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 92, 116, 250)
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'รหัสอ้างอิง : *9HD-21',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
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
                      side: BorderSide(
                          color: const Color.fromARGB(255, 92, 116, 250)),
                      backgroundColor: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    onPressed: () {
                     
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
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
