
import 'package:ev_appcharger/Login/SuccessRegister.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(6, (index) => FocusNode());
    _controllers = List<TextEditingController>.generate(
        6, (index) => TextEditingController());
    _controllers
        .forEach((controller) => controller.addListener(_onTextChanged));
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _onTextChanged() {
    for (int i = 0; i < _controllers.length - 1; i++) {
      if (_controllers[i].text.isNotEmpty) {
        _focusNodes[i].unfocus();
        _focusNodes[i + 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ลงทะเบียน', textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 18),
                Icon(
                  Icons.phone,
                  size: 18,
                  color: const Color.fromARGB(255, 92, 116, 250),
                ),
                SizedBox(width: 18),
                Text(
                  'หมายเลขโทรศัพท์',
                  style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 92, 116, 250)),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'ป้อนรหัสยืนยันของคุณ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'คุณพึ่งส่งรหัสยืนยันถึงคุณไปที่ หมายเลขโทรศัพท์ของคุณ',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 20), // Add space between text and OTP input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 50, // Adjust width of each OTP input box
                        height: 80, // Adjust height of each OTP input box
                        child: TextField(
                          controller: _controllers[index],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 16),
                          focusNode: _focusNodes[index],
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.indigo[100],
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                          ),
                          onChanged: (String value) {
                            if (value.isEmpty) {
                              _focusNodes[index].unfocus();
                              if (index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            } else {
                              _focusNodes[index].unfocus();
                              if (index < _controllers.length - 1) {
                                _focusNodes[index + 1].requestFocus();
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ), // Add space between OTP input and button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessRegister()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ), backgroundColor: const Color.fromARGB(255, 92, 116,
                          250), // Set the background color of the button
                      minimumSize: Size(
                          400, 50), // Set the width and height of the button
                    ),
                    child: Text('ตรวจสอบ'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'คุณสามารถขอได้อีกครั้ง ',
                      ),
                      TextSpan(
                        text: 'ส่งอีกครั้ง !',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 92, 116, 250)),
                      ),
                    ],
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
