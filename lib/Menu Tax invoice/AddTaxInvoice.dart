import 'package:ev_appcharger/Menu%20Tax%20invoice/TaxInvoiceList.dart';
import 'package:flutter/material.dart';


class AddTaxInvoice extends StatefulWidget {
  @override
  _AddTaxInvoiceState createState() => _AddTaxInvoiceState();
}

class _AddTaxInvoiceState extends State<AddTaxInvoice> {
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
        title: const Text(
          'ข้อมูลใบกำกับภาษี',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => TaxInvoiceList(),
              ),
            );
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
                  'ข้อมูลใบกำกับภาษี',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),
            _buildButton(
              context,
              "เลขประจำตัวผู้เสียภาษี",
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
                  ),
                ],
              ),
              textColor: const Color.fromARGB(255, 92, 116, 250),
            ),
            _buildButton(
              context,
              "รหัสสาขา",
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
                  ),
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
            SizedBox(height: 8.0),
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
                    side: BorderSide(color: Color.fromARGB(255, 92, 116, 250)),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TaxInvoiceList()),
                    );
                  },
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 92, 116, 250),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
