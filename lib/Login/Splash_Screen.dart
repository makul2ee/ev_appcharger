
import 'package:ev_appcharger/Login/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Import library for Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentImageIndex = 1; // Initial image index
  late Timer _timer; // Declare timer variable

  AssetImage getAssetImage(int index) {
    // Return AssetImage based on the index
    if (index == 1) {
      return AssetImage("images/$index.png");
    } else {
      return AssetImage("images/$index.jpg");
    }
  }

  @override
  void initState() {
    super.initState();
    // Start a timer to change the image every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        // Update the current image index
        _currentImageIndex = (_currentImageIndex % 3) + 1;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 201, 243), // Background color
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // Dynamically load image based on current index
                    image: getAssetImage(_currentImageIndex),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'ยินดีต้อนรับสู่ EV Charge',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'นำทางได้อย่างง่ายดายและจองการชาร์จที่มีอยู่\nสถานีใกล้คุณที่สุด',
                  textAlign: TextAlign.center, // Set text alignment to center
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            SizedBox(height: 240.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity, // Make button full width
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 92, 116, 250)), // Button border color
                    backgroundColor: const Color.fromARGB(255, 92, 116, 250), // Button background color
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  child: Text(
                    'เริ่มต้นการใช้งาน',
                    style: TextStyle(fontSize: 16.0, color: Colors.white), // Button text color
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
