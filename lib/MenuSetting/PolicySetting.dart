
import 'package:ev_appcharger/MenuSetting/Setting.dart';
import 'package:ev_appcharger/MenuSetting/lawSetting.dart';
import 'package:flutter/material.dart';

class PolicySetting extends StatefulWidget {
  @override
  _PolicySettingState createState() => _PolicySettingState();
}

class _PolicySettingState extends State<PolicySetting> {
  bool _isCheckedTerms = false; // สร้างตัวแปรเก็บสถานะของ Checkbox
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('นโยบายและความเป็นส่วนตัว', textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
         Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LawSetting(),
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
                      'images/5.jpg'), // เปลี่ยนเส้นทางไปยังภาพของคุณ
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
                  'นโยบายการคุ้มครองข้อมูล',
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
                  'หากผู้ใช้ได้ทำการสร้างบัญชีผู้ใช้บนเว็บไซต์ PDPA Core ของเรา ท่านมีหน้าที่ในการรักษาความปลอดภัยของบัญชีของท่านและท่านต้องรับผิด ชอบต่อกิจกรรมทั้งหมดที่เกิดขึ้นภายใต้การใช้บัญชีหรือการดำเนินการอื่นใด ที่เกี่ยวข้องกับบัญชีนั้น โดยเราไม่มีหน้าที่ในการดูแลและตรวจสอบบัญชีใหม่ก่อนที่ท่านจะลงชื่อเข้าใช้และใช้บริการของเรา การให้ข้อมูลติดต่อที่เป็นเท็จไม่ว่าประเภทใดก็ตามอาจส่งผลให้บัญชีของท่านถูกยุติการใช้งาน นอกจากนี้ ท่านต้องแจ้งให้เราทราบทันทีเมื่อบัญชีของท่านถูกนำไปใช้โดยไม่ได้รับอนุญาตหรือมีการละเมิดความปลอดภัยอื่น ๆ ทางเราจะไม่รับผิดชอบต่อความเสียหายใด ๆ ที่เกิดขึ้นจากการกระทำหรือการละเว้นใด ๆ ของท่าน เราอาจทำการระงับ ปิดใช้งานหรือลบบัญชีของท่าน (หรืออย่างใดอย่างหนึ่ง) หากเราพิจารณาว่าท่านได้ละเมิดข้อกำหนดใด ๆ ของข้อตกลงนี้หรือการกระทำของท่านมีแนวโน้มที่จะทำลายชื่อเสียงและค่าความนิยมของเรา หากเราลบบัญชีของท่านด้วยเหตุผลข้างต้น ท่านจะไม่สามารถลงทะเบียนใหม่เพื่อใช้บริการของเราได้ โดยเราอาจทำการปิดกั้นที่อยู่อีเมลและที่อยู่อินเทอร์เน็ตโปรโตคอลของท่านเพื่อป้องกันการลงทะเบียนอีกครั้ง',
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
                  'บริษัทจะเก็บรวบรวม ใช้ หรือเปิดเผยข้อมูลส่วนบุคคลของท่านที่ได้ให้แก่บริษัทด้วยความระมัดระวัง และเป็นไปตามมาตรฐานที่กำหนดภายใต้ “นโยบายความเป็นส่วนตัว” ของบริษัท ซึ่งถือเป็นส่วนหนึ่งของข้อกำหนดและเงื่อนไขฯ ฉบับนี้',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(
                        255, 231, 231, 231)), // เพิ่มขอบกล่อง
                borderRadius: BorderRadius.circular(9.0), // เพิ่มขอบมน
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text(
                      'ฉันยอมรับนโยบายการคุ้มครองข้อมูลทั้งหมด',
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
                        builder: (context) => Setting(),
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
