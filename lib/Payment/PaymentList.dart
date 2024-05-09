
import 'package:ev_appcharger/Payment/AddPayment.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  Widget _buildButton(
    BuildContext context,
    String titleText,
    String subTitleText,
    Widget trailingWidget,
    IconData iconData, {
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
            color: Color.fromARGB(255, 240, 239, 239),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      iconData,
                      size: 20,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    SizedBox(width: 8), // Adjust spacing if needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleText,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ),
                        Text(
                          subTitleText,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailingWidget,
              ],
            ),
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
          'การชำระเงิน',
          textAlign: TextAlign.center,
        ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ช่องทางแนะนำ',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AddPayment(),
                      ));
                      },
                      child: Row(
                        children: [
                          Text(
                            'เติมเงิน',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(
                                  255, 92, 116, 250), // สีของเติมเงิน
                            ),
                          ),
                          Icon(
                            Icons.play_arrow,
                            size: 14,
                            color: const Color.fromARGB(255, 92, 116, 250),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'Ev Station Pay',
              'เปิดใช้งานจำนวนวอเล็ตและชำระเงิน',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Container(
                  constraints:
                      BoxConstraints(minWidth: 0, maxWidth: double.infinity),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "ยอดเงินคงเหลือสำหรับใช้จ่าย",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align text to the start of the row
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 12,
                            color: Colors.green,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "0.00",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icons.description,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'วิธีการชำระเงิน',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'บัตรเครดิต/เดบิต',
              'เปิดใช้งานวอเล็ตและการชำระเงิน',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              LineAwesome.cc_visa
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'ชำระเงินปลายทาง',
              'Cash on Delivery',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.attach_money,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'ทรูมันนี่ วอลเล็ต',
              'เติมเงินให้เพียงพอก่อนใช้จ่าย',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.money,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'โอนเงินผ่านแอปธนาคาร',
              'โมบายแบงก์กิ้ง',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.mobile_screen_share,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'ชำระผ่านหมายเลขอ้างอิง',
              'ชำระบิลผ่านแอปพลิเคชันธนาคาร',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.payment,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'อินเตอร์เน็ตแบงค์กิ้ง',
              'เข้าสู่ระบบบัญชีธนาคารเพื่อชำระเงิน',
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => PolicySetting(),
                  // ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.account_balance,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'ไลน์เพย์',
              'ผูกบัตรหรือเติมเงินให้เพียงพอก่อนการใช้จ่าย',
              GestureDetector(
                onTap: () {
// Navigator.of(context).pushReplacement(MaterialPageRoute(
// builder: (context) => PolicySetting(),
// ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.payment,
            ),
            SizedBox(height: 2.0),
            _buildButton(
              context,
              'QR พร้อมเพย์',
              'สแกน QR Code เพื่อชำระเงิน',
              GestureDetector(
                onTap: () {
// Navigator.of(context).pushReplacement(MaterialPageRoute(
// builder: (context) => PolicySetting(),
// ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 14,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    ),
                  ],
                ),
              ),
              Icons.payment,
            ),
          ],
        ),
      ),
    );
  }
}
