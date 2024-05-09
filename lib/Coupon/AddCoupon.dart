
import 'package:ev_appcharger/Coupon/CouponList.dart';
import 'package:flutter/material.dart';

class AddCoupon extends StatefulWidget {
  @override
  _AddCouponState createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  TextEditingController _couponController = TextEditingController();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 92, 116, 250),
      title: Text('เพิ่มคูปอง', textAlign: TextAlign.center),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => CouponList(),
            ),
          );
        },
      ),
    ),
    
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20), // Adjust the bottom padding as needed
            child: Image.asset(
              'assets/your_image.png', // Replace 'your_image.png' with your image file path
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
          ),
          SizedBox(height: 10), // Adding some space between the image and the text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code), // Icon next to the text
              SizedBox(width: 5), // Adding some space between the icon and the text
              Text(
                'เปิดกล้องสแกน QR Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15), // Adding some space between the icon and the text
          Text(
            "--------------------------------------------   หรือ   --------------------------------------------",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          SizedBox(height: 15), // Adding some space between the lines
          Text(
            'ใส่รหัสเพื่อรับคูปอง',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10), // Adding some space before the text field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set the background color of the TextField
                borderRadius: BorderRadius.circular(10), // Add rounded corners
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _couponController,
                  decoration: InputDecoration(
                    hintText: 'รหัสคูปอง',
                    border: InputBorder.none, // Remove the border
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Add space between OTP input and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AddCoupon(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                backgroundColor: const Color.fromARGB(255, 92, 116, 250), // Button background color
                minimumSize: Size(double.infinity, 50), // Button dimensions
              ),
              child: Text('เพิ่มคูปอง'),
            ),
          ),
        ],
      ),
    ),
  );
}

}
