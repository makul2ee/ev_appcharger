
import 'package:ev_appcharger/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

class SuccessRegister extends StatefulWidget {
  @override
  _SuccessRegisterState createState() => _SuccessRegisterState();
}

class _SuccessRegisterState extends State<SuccessRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ลงทะเบียนเรียบร้อยแล้ว',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 92, 116, 250),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'หากไม่ได้รับอีเมล์ กรุณาติดต่อ ศูนย์บริการข้อมูลแอป EV',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'contact@ev.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                    Text(
                      '  โทร.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '02 222 111',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 92, 116, 250),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  minimumSize: Size(400, 50),
                  backgroundColor: const Color.fromARGB(
                      255, 92, 116, 250), // Set button color here
                ),
                child: Text(
                  'เสร็จสิ้น',
                  style: TextStyle(
                    fontSize: 14, // Set font size here
                    fontWeight: FontWeight.bold, // Set font weight here
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
