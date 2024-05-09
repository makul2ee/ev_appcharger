
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class Scanqrcode extends StatefulWidget {
  @override
  _ScanqrcodeState createState() => _ScanqrcodeState();
}

class _ScanqrcodeState extends State<Scanqrcode> {
  late String scanresult = "ยังไม่มีข้อมูล";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('สแกน', textAlign: TextAlign.center),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Homepage1(),
                      ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ผลการสแกน", style: TextStyle(fontSize: 20)),
                    Text(
                      scanresult,
                      style: TextStyle(
                        fontSize: 20,
                        color: scanresult == "ยังไม่มีข้อมูล" ? Colors.yellow : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startScan(),
        tooltip: 'Scan',
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }

  void startScan() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }

    if (await Permission.camera.isGranted) {
      String? cameraScanResult = await scanner.scan();
      setState(() {
        scanresult = cameraScanResult ?? "ยังไม่มีข้อมูล";
      });
    } else {
      // Handle denied permissions
    }
  }
}
