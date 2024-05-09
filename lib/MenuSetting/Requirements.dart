
import 'package:ev_appcharger/MenuSetting/Setting.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';

class Requirements extends StatefulWidget {
  @override
  _RequirementsState createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  bool _isCheckedTerms = false; // สร้างตัวแปรเก็บสถานะของ Checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ข้อกำนดและเงื่อนไข', textAlign: TextAlign.center),
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
          children: [
            // ตำแหน่งของ banner image ที่เพิ่มเข้ามา
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'images/4.jpg'), // เปลี่ยนเส้นทางไปยังภาพของคุณ
                  fit: BoxFit.cover,
                ),
              ),
              height: 200, // กำหนดความสูงของ banner image
              width: double.infinity, // กำหนดความกว้างของ banner image
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ข้อกำนดและเงื่อนไข',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ข้อกำหนดและเงื่อนไขการใช้เว็บไซต์หรือการใช้แอปพลิเคชัน หรือข้อตกลงการใช้เว็บไซต์หรือการใช้แอปพลิเคชัน เป็นสัญญาประเภทหนึ่งที่เจ้าของเว็บไซต์หรือแอปพลิเคชันกำหนดขึ้นเพื่อกำหนดและควบคุมเงื่อนไขลักษณะการใช้เว็บไซต์หรือแอปพลิเคชันของตนจากผู้เยี่ยมชม ผู้ใช้ หรือสมาชิกของเว็บไซต์หรือแอปพลิเคชัน เพื่อจุดประสงค์ต่างๆ เช่น',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'เพื่อให้เกิดประสิทธิภาพสูงสุดในการใช้งาน เช่น การแจ้งให้ผู้เยี่ยมชม ผู้ใช้ หรือสมาชิกของเว็บไซต์หรือแอปพลิเคชัน ทราบถึงจุดเด่น คุณลักษณะจำเพาะของเว็บไซต์หรือแอปพลิเคชัน หรือความต้องการขั้นต่ำของระบบ (Minimum System Requirements) ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ในการใช้เว็บไซต์หรือแอปพลิเคชันนั้นๆเพื่อป้องกันความเสียหายที่อาจเกิดขึ้นกับเว็บไซต์หรือแอปพลิเคชันจากการใช้งานไม่ถูกต้องหรือไม่ถูกวิธี เช่น การห้ามโพสข้อความรูปภาพในเว็บไซต์ที่มีขนาดใหญ่ของสมาชิกจนทำให้เว็บไซต์หรือแอปพลิเคชันทำงานช้ากว่าปกติและทำให้ระบบมีการใช้ทรัพยากรสูง (Server Load) เพื่อป้องกันความเสี่ยงจากความรับผิดทางกฎหมายของผู้เป็นเจ้าของเว็บไซต์หรือแอปพลิเคชัน หากมีการใช้เว็บไซต์หรือแอปพลิเคชันดังกล่าวที่ผิดกฎหมายหรือละเมิดสิทธิของผู้อื่น โดยผู้เยี่ยมชม ผู้ใช้ หรือสมาชิกของเว็บไซต์หรือแอปพลิเคชันนั้นๆ ซึ่งเป็นที่สำคัญที่สุด เช่น การสงวนสิทธิตามกฎหมายของผลงาน ข้อมูล และการออกแบบที่เจ้าของเว็บไซต์หรือแอปพลิเคชันเผยแพร่บนเว็บไซต์หรือแอปพลิเคชัน การห้ามโพสข้อความในเว็บไซต์หรือแอปพลิเคชันที่เป็นการละเมิดลิขสิทธิ์ของผู้อื่น (Copyright Infringement)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(
                        255, 231, 231, 231)), // เพิ่มขอบกล่อง
                borderRadius: BorderRadius.circular(20.0), // เพิ่มขอบมน
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      'ฉันยอมรับเงื่อนไขและข้อกำหนดทั้งหมด',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
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
            SizedBox(
              height: 15,
            ), // Add space between OTP input and button
            ElevatedButton(
              onPressed: () {
               Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Setting (),
                      ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ), backgroundColor: const Color.fromARGB(255, 92, 116,
                    250), // Set the background color of the button
                minimumSize:
                    Size(400, 50), // Set the width and height of the button
              ),
              child: Text('ยืนยัน'),
            ),
          ],
        ),
      ),
    );
  }
}
