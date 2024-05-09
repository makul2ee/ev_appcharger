
import 'package:ev_appcharger/MenuSetting/lawSetting.dart';
import 'package:flutter/material.dart';

class PrivacySetting extends StatefulWidget {
  @override
  _PrivacySettingState createState() => _PrivacySettingState();
}

class _PrivacySettingState extends State<PrivacySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ประกาศความเป็นส่วนตัวสำหรับลูกค้า',
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
                'ประกาศความส่วนตัวสำหรับลูกค้า',
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
                  'เรามุ่งมั่นที่จะปกป้องความเป็นส่วนตัวของคุณเมื่อคุณใช้บริการของเรา ประกาศความเป็นส่วนตัวนี้จะอธิบายถึงวิธีการที่เรารวบรวมใช้ และแบ่งปันข้อมูลส่วนบุคคลของคุณ โปรดอ่านข้อมูลด้านล่างเพื่อทำความเข้าใจนโยบายและวิธีการของเรา',
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
                '* ข้อมูลที่คุณให้: เรารวบรวมข้อมูลที่คุณให้กับเราโดยตรง เช่น ชื่อ อีเมล หมายเลขโทรศัพท์ ที่อยู่ และข้อมูลการชำระเงิน\n * ข้อมูลจากการใช้งาน: เราอาจรวบรวมข้อมูลเกี่ยวกับการใช้งานบริการของคุณ เช่น การใช้งานเว็บไซต์หรือแอปพลิเคชันของเรา การดูและคลิกโฆษณา และการสั่งซื้อสินค้า\n * ข้อมูลจากแหล่งอื่นๆ: เราอาจได้รับข้อมูลจากบุคคลภายนอก เช่น พันธมิตรทางธุรกิจหรือแหล่งข้อมูลอื่นๆ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '2. การใช้ข้อมูล',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '* ให้บริการ: เราใช้ข้อมูลของคุณเพื่อให้บริการและสนับสนุนคุณ เช่น การจัดส่งสินค้า การตอบคำถาม และการให้คำแนะนำ \n * การตลาด: เราอาจใช้ข้อมูลของคุณเพื่อส่งข้อเสนอหรือโปรโมชั่นเกี่ยวกับสินค้าและบริการของเรา \n * การปรับปรุงบริการ: เราใช้ข้อมูลเพื่อปรับปรุงและพัฒนาบริการของเราให้ดียิ่งขึ้น',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '3. การแบ่งปันข้อมูล',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '* การให้บริการ: เราอาจแบ่งปันข้อมูลกับบุคคลที่เกี่ยวข้องเพื่อให้บริการแก่คุณ เช่น บริษัทจัดส่งสินค้า หรือบริษัทที่เกี่ยวข้องกับการชำระเงิน \n * กฎหมาย: เราอาจเปิดเผยข้อมูลของคุณหากจำเป็นตามกฎหมายหรือเพื่อปกป้องสิทธิ์และความปลอดภัยของเรา',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '4. การรักษาความปลอดภัยข้อมูล',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'เราใช้มาตรการทางเทคนิคและการบริหารจัดการเพื่อรักษาความปลอดภัยของข้อมูลส่วนบุคคลของคุณ แต่เราไม่สามารถรับประกันความปลอดภัยของข้อมูล 100% อย่างไรก็ตาม เราจะพยายามอย่างดีที่สุดเพื่อปกป้องข้อมูลของคุณ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '5. สิทธิ์ของคุณ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'คุณมีสิทธิ์ในการเข้าถึง แก้ไข หรือลบข้อมูลส่วนบุคคลของคุณได้โดยติดต่อเรา นอกจากนี้ คุณยังสามารถขอยกเลิกการรับข้อเสนอการตลาดได้ตามต้องการ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '6. การเปลี่ยนแปลงประกาศความเป็นส่วนตัว',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'เราขอสงวนสิทธิ์ในการปรับปรุงประกาศความเป็นส่วนตัวนี้เมื่อจำเป็น โปรดตรวจสอบประกาศนี้เป็นระยะเพื่อรับทราบข้อมูลล่าสุด',
                  style: TextStyle(fontSize: 16),
                ), 
                ),
          ],
        ),
      ),
    );
  }
}
