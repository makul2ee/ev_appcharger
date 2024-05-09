import 'package:flutter/material.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  bool charging = false;
  String? selectedPaymentOption;

  Widget _buildButton(
    BuildContext context,
    String titleText,
    IconData iconData, {
    double containerPadding = 12.0,
    Color textColor = Colors.black,
    required VoidCallback onTap,
    String? selectedOption,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(containerPadding),
        margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color.fromARGB(255, 240, 239, 239),
          ),
        ),
        child: Row(
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
                SizedBox(width: 8),
                Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              selectedOption ?? "ไม่มีข้อมูล",
              style: TextStyle(
                fontSize: 10.0,
                color: const Color.fromARGB(255, 92, 116, 250),
              ),
            ),
            Icon(
              Icons.play_arrow,
              size: 12,
              color: const Color.fromARGB(255, 92, 116, 250),
            ),
          ],
        ),
      ),
    );
  }

  
  void _showPaymentOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "เลือกการชำระเงิน",
            textAlign: TextAlign.center,
          ),
          content: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Color.fromARGB(255, 226, 227, 228),
              ),
            ),
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 3.0),
                  _buildPaymentOption(
                      context, 'บัตรเครดิต/เดบิต', Icons.credit_card),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(
                      context, "ชำระเงินปลายทาง", Icons.attach_money),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(
                      context, "ทรูมันนี่ วอลเล็ต", Icons.monetization_on),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(context, "โอนเงินผ่านแอปธนาคาร",
                      Icons.mobile_screen_share),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(
                      context, "ชำระผ่านหมายเลขอ้างอิง", Icons.payment),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(
                      context, "อินเตอร์เน็ตแบงค์กิ้ง", Icons.account_balance),
                  _buildPaymentOption(context, "ไลน์เพย์", Icons.payment),
                  SizedBox(height: 3.0),
                  _buildPaymentOption(context, "QR พร้อมเพย์", Icons.payment),
                ],
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20.0),
        );
      },
    );
  }

  Widget _buildPaymentOption(
      BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          selectedPaymentOption = title; // เก็บข้อมูลที่เลือกเข้าตัวแปร selectedPaymentOption
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 8.0),
                Text(title),
              ],
            ),
            Icon(
              Icons.play_arrow,
              size: 12,
              color: const Color.fromARGB(255, 92, 116, 250),
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
        title: Text('เช็คอิน'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'เสียบที่ชาร์จเข้า รถและเริ่มชาร์จ',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 92, 116, 250),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Image.asset(
                            'images/5.jpg',
                            width: 100.0,
                            height: 100.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            charging ? Icons.check_circle : Icons.cancel,
                            color: charging ? Colors.green : Colors.red,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            charging ? 'กำลังชาร์จ' : 'ยังไม่ได้เสียบชาร์จ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: charging ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'รายละเอียดสถานีชาร์จ',
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
              _buildButton(context, 'สถานที่ชาร์จ : ', Icons.ev_station,
                  onTap: () {}),
              SizedBox(height: 2.0),
              _buildButton(
                  context, 'ประเภทหัวชาร์จ : ', Icons.battery_charging_full,
                  onTap: () {}),
              SizedBox(height: 2.0),
              _buildButton(context, 'ค่าบริการ : ', Icons.money, onTap: () {}),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'รายละเอียดผู้ใช้',
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
              _buildButton(context, 'รถไฟฟ้า : ', Icons.electric_car,
                  onTap: () {}),
              SizedBox(height: 2.0),
              _buildButton(context, 'ชื่อผู้ขับ : ', Icons.person,
                  onTap: () {}),
              SizedBox(height: 2.0),
              _buildButton(context, 'เลือกการชำระเงิน : ', Icons.payment,
                  onTap: () {
                _showPaymentOptionsDialog(context);
              },
                  selectedOption:
                      selectedPaymentOption), // ส่ง selectedPaymentOption ไปยัง _buildButton
              SizedBox(height: 2.0),
              _buildButton(context, 'เลือกคูปอง : ', Icons.card_giftcard,
                  onTap: () {}),
              SizedBox(height: 20.0),
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
                      setState(() {
                        charging = !charging;
                      });
                    },
                    child: Text(
                      'เริ่มชาร์จ',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.location_on, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.history, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
