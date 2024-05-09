
import 'package:ev_appcharger/User/Changedatauser.dart';
import 'package:ev_appcharger/User/OtpChangephone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Changephonenumber extends StatefulWidget {
  @override
  _ChangephonenumberState createState() => _ChangephonenumberState();
}

class _ChangephonenumberState extends State<Changephonenumber> {
  bool _isCheckedPolicy = false;
  bool _isCheckedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text(
          'เปลี่ยนเบอร์โทรศัพท์มือถือ',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Changedatauser(),
                      ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'เปลี่ยนเบอร์โทรศัพท์มือถือ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                decoration: InputDecoration(
                  labelText: 'เบอร์มือถือ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigo[200]),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // เพิ่มขอบกล่อง
                  borderRadius: BorderRadius.circular(9.0), // เพิ่มขอบมน
                ),
                child: CheckboxListTile(
                  title: Text(
                    'ฉันยอมรับนโยบายการคุ้มครองข้อมูลทั้งหมด',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isCheckedPolicy,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedPolicy = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // เพิ่มขอบกล่อง
                  borderRadius: BorderRadius.circular(9.0), // เพิ่มขอบมน
                ),
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: Text(
                        'ฉันยอมรับเงื่อนไขและข้อกำหนดทั้งหมด',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isCheckedTerms,
                      onChanged: (value) {
                        setState(() {
                          _isCheckedTerms = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'การดำเนินการต่อแสดงว่าคุณยอมรับข้อกำหนดการใช้งานและ\nนโยบายความเป็นส่วนตัว',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ), // Add space between OTP input and button
              ElevatedButton(
                onPressed: () {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => OtpChangephone(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ), backgroundColor: const Color.fromARGB(255, 92, 116,
                      250), // Set the background color of the button
                  minimumSize: Size(
                      400, 50), // Set the width and height of the button
                ),
                child: Text('ตรวจสอบ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
