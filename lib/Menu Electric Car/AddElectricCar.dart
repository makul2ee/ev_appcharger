
import 'package:ev_appcharger/Menu%20Electric%20Car/ElectricCarList.dart';
import 'package:flutter/material.dart';

class AddElectricCar extends StatefulWidget {
  @override
  _AddElectricCarState createState() => _AddElectricCarState();
}

class _AddElectricCarState extends State<AddElectricCar> {
  bool receiveNotification = false;
  Widget _buildButton(
    BuildContext context,
    String text,
    Widget trailingWidget, {
    double containerPadding = 12.0,
    Color textColor = Colors.black,
  }) {
    return InkWell(
      onTap: () {
        // Add onTap action here
      },
      child: Container(
        padding: EdgeInsets.all(containerPadding),
        margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color.fromARGB(255, 240, 240, 240),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Adjust spacing if needed
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
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
        title: Text('ข้อมูลรถยนต์ไฟฟ้า', textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ElectricCarList(),
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
                  'ข้อมูลรถยนต์ไฟฟ้า',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              "ยี่ห้อรถยนต์",
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
              "ไม่ได้ตั้งค่า",
              style: TextStyle(
                fontSize: 10.0,
                color: const Color.fromARGB(255, 92, 116, 250),
              ),
            ),
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: Color.fromARGB(255, 92, 116, 250),
                  ),
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            _buildButton(
              context,
              "รุ่นรถยนต์",
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
              "ไม่ได้ตั้งค่า",
              style: TextStyle(
                fontSize: 10.0,
                color: const Color.fromARGB(255, 92, 116, 250),
              ),
            ),
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  )
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            _buildButton(
              context,
              "ทะเบียนรถยนต์",
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
              "ไม่ได้ตั้งค่า",
              style: TextStyle(
                fontSize: 10.0,
                color: const Color.fromARGB(255, 92, 116, 250),
              ),
            ),
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  )
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            _buildButton(
              context,
              "เลือกจังหวัด",
              Row(
                children: [
                  SizedBox(width: 8),
                  
            Text(
              "ไม่ได้ตั้งค่า",
              style: TextStyle(
                fontSize: 10.0,
                color: const Color.fromARGB(255, 92, 116, 250),
              ),
            ),
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  )
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            _buildButton(
              context,
              "ตั้งค่าเริ่มต้น",
              Switch(
                value: receiveNotification,
                onChanged: (value) {
                  setState(() {
                    receiveNotification = value;
                  });
                },
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
              containerPadding: 10.0,
            ),
            SizedBox(
              height: 15,
            ), // Add space between OTP input and button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ElectricCarList(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ), backgroundColor: const Color.fromARGB(
                      255, 92, 116, 250), // Set the background color of the button
                  minimumSize: Size(
                      370, 45), // Set the width and height of the button
                ),
                child: Text('ยืนยัน'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
