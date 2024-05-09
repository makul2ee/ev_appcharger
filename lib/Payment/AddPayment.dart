import 'package:ev_appcharger/Payment/PaymentList.dart';
import 'package:flutter/material.dart';


class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String amount = '';

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
                SizedBox(width: 8), // Adjust spacing if needed
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                    Text(
                      subTitleText,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: const Color.fromARGB(255, 92, 116, 250),
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'จำนวนเงินที่ต้องการเติม',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 35.0, // Set the desired height here
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'ใส่จำนวนเงินที่ต้องการเติม',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.indigo[50],
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ราคารวมทั้งหมด',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 14,
                      color: Colors.green,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "0.00",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
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
          'Ev Station App',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => PaymentList(),
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
                  Align(                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ยอดเงินในบัญชี Ev Station App',
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 14,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "0.00",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
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
                      'ธนาคาร',
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
              'บัญชีธนาคาร',
              'เลือกบัญชีธนาคาร',
              GestureDetector(
                onTap: () {
                  // Add onTap action here
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.play_arrow,
                      size: 12,
                      color: const Color.fromARGB(255, 92, 116, 250),
                    )
                  ],
                ),
              ),
              Icons.account_balance,
            ),
            _buildPaymentCard(context),

            SizedBox(
              height: 15,
            ), // Add space between OTP input and button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (context) => OtpChangephone(),
                  //       ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ), backgroundColor: const Color.fromARGB(255, 92, 116,
                      250), // Set the background color of the button
                  minimumSize: Size(
                      350, 50), // Set the width and height of the button
                ),
                child: Text('ยืนยัน'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

                   
