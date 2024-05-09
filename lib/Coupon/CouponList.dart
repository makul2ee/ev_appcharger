
import 'package:ev_appcharger/Coupon/AddCoupon.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class CouponList extends StatefulWidget {
  @override
  _CouponListState createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('คูปองของฉัน', textAlign: TextAlign.center),
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
              unSelectedTextStyle: TextStyle(color: Colors.black),
              labels: ["คูปองของฉัน", "คูปองที่ใช้แล้ว/หมดอายุ"],
              selectedLabelIndex: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: Center(
                child: selectedIndex == 0
                    ? Text(
                        "ยังไม่มีคูปอง",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 92, 116, 250),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "ยังไม่มีคูปอง",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 92, 116, 250),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            SizedBox(height: 0),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AddCoupon(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 92, 116, 250),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 20), // เพิ่มไอคอนบวก
                    SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                    Text('เพิ่มคูปอง', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
