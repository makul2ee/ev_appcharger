
import 'package:ev_appcharger/MenuSetting/lawSetting.dart';
import 'package:flutter/material.dart';

class PrivacyCarpark extends StatefulWidget {
  @override
  _PrivacyCarparkState createState() => _PrivacyCarparkState();
}

class _PrivacyCarparkState extends State<PrivacyCarpark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ประกาศความเป็นส่วนตัวสำหรับลานจอดรถยนต์',
            textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LawSetting(),
            ))
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ประกาศความเป็นส่วนตัวสำหรับลานจอดรถยนต์',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'เรามุ่งมั่นที่จะปกป้องความเป็นส่วนตัวและข้อมูลส่วนบุคคลของคุณเมื่อใช้บริการลานจอดรถยนต์ของเรา ประกาศความเป็นส่วนตัวนี้จะอธิบายถึงวิธีการที่เรารวบรวม ใช้ และแบ่งปันข้อมูลส่วนบุคคลของคุณ โปรดอ่านข้อมูลด้านล่างเพื่อทำความเข้าใจนโยบายและวิธีการของเรา',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1. ข้อมูลส่วนบุคคลที่เรารวบรวม',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  '* ข้อมูลการจอดรถ: เรารวบรวมข้อมูลเกี่ยวกับการจอดรถของคุณ เช่น เวลาและวันที่คุณเข้าสู่ลานจอดรถ ระยะเวลาที่จอด และหมายเลขป้ายทะเบียนรถ \n* ข้อมูลการชำระเงิน: เมื่อคุณชำระค่าบริการจอดรถ เรารวบรวมข้อมูลการชำระเงิน เช่น บัตรเครดิตหรือข้อมูลบัญชีธนาคาร \n* ข้อมูลการเฝ้าระวัง: เราอาจใช้กล้องวงจรปิดเพื่อเฝ้าระวังและบันทึกการเคลื่อนไหวในลานจอดรถ',
                  style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2. การใช้ข้อมูล',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '* การจัดการการจอดรถ: เราใช้ข้อมูลการจอดรถของคุณเพื่อจัดการพื้นที่จอดรถและอำนวยความสะดวกในการจอดรถ \n* การชำระเงิน: เราใช้ข้อมูลการชำระเงินของคุณเพื่อดำเนินการชำระค่าบริการจอดรถ \n * ความปลอดภัย: ข้อมูลการเฝ้าระวังใช้เพื่อรักษาความปลอดภัยและป้องกันการละเมิดหรือการกระทำที่ไม่พึงประสงค์',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '3. การแบ่งปันข้อมูล',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '* พันธมิตรทางธุรกิจ: เราอาจแบ่งปันข้อมูลกับพันธมิตรทางธุรกิจ เช่น บริษัทชำระเงิน หรือผู้ให้บริการรักษาความปลอดภัย เพื่ออำนวยความสะดวกในการให้บริการ \n * การเปิดเผยตามกฎหมาย: เราอาจเปิดเผยข้อมูลของคุณหากจำเป็นตามกฎหมาย หรือเพื่อปกป้องสิทธิ์และความปลอดภัยของเรา',
                  style: TextStyle(fontSize: 16 ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '4. การรักษาความปลอดภัยข้อมูล',
                  style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
                ),
              ), 
              ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                'เราใช้มาตรการทางเทคนิคและการบริหารจัดการเพื่อรักษาความปลอดภัยของข้อมูลส่วนบุคคลของคุณ แต่เราไม่สามารถรับประกันความปลอดภัยของข้อมูล 100% อย่างไรก็ตาม เราจะพยายามอย่างดีที่สุดเพื่อปกป้องข้อมูลของคุณ',
                style: TextStyle(fontSize: 16),
               ),
              ),
          ],
        ),
      ),
    );
  }
}
