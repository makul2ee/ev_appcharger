
import 'package:ev_appcharger/MenuSetting/PolicySetting.dart';
import 'package:ev_appcharger/MenuSetting/PrivacyCarpark.dart';
import 'package:ev_appcharger/MenuSetting/PrivacySetting.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';

class LawSetting extends StatefulWidget {
  @override
  _LawSettingState createState() => _LawSettingState();
}

class _LawSettingState extends State<LawSetting> {
  Widget _listTitleButton(
    BuildContext context,
    String text,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 0.5, // ลดค่า elevation ให้เล็กลง
      margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0), // ลดค่า margin เพื่อทำให้ขนาด card เล็กลง
      child: ListTile(
        leading: Icon(
          iconData,
          size: 20.0, // ลดขนาดของไอคอน
          color: Color.fromARGB(255, 92, 116, 250),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16.0, // ลดขนาดของข้อความ
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.0, // ลดขนาดของไอคอน
          color: Colors.grey,
        ),
        onTap: onPressed,
      ),
    );
  }

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
              builder: (context) => UserList(onSetThemeMode: (ThemeMode ) {  },),
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
              child: Text(
                'การคุ้มครองข้อมูลส่วนบุคคล',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
              ),
            ),
            SizedBox(height: 2.0),
            _listTitleButton(
              context,
              'นโยบายการคุ้มครองข้อมูล',
              Icons.receipt,
              () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PolicySetting(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            _listTitleButton(
              context,
              'ประกาศความเป็นส่วนตัวสำหรับลูกค้า',
              Icons.receipt,
              () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PrivacySetting(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            _listTitleButton(
              context,
              'ประกาศความเป็นส่วนตัวสำหรับลานจอดรถยนต์',
              Icons.receipt,
              ()  {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PrivacyCarpark(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
