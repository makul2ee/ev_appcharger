
import 'package:ev_appcharger/Menu%20Tax%20invoice/AddTaxInvoice.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';

class TaxInvoiceList extends StatefulWidget {
  @override
  _TaxInvoiceListState createState() => _TaxInvoiceListState();
}

class _TaxInvoiceListState extends State<TaxInvoiceList> {
  final List<Map<String, String>> TaxInvoice = [
    {
      'taxid': '02100445551',
      'branchcode': 'สำนักงานใหญ่ 1',
    },
    {
      'taxid': '02100445552',
      'branchcode': 'สำนักงานใหญ่ 2',
    },
    // Add more electric car data as needed
  ];

  // Map to store the toggle switch state for each car
  Map<int, bool> switchStateMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('ข้อมูลใบกำกับภาษี', textAlign: TextAlign.center),
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: TaxInvoice.length,
              itemBuilder: (context, index) {
                final tax = TaxInvoice[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'เลขประจำตัวผู้เสียภาษี : ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)),
                                ),
                                TextSpan(
                                  text: '${tax['taxid']}',
                                  style: TextStyle(
                                      color: Colors.grey), // Gray font color
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'รหัสสาขา : ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)),
                                ),
                                TextSpan(
                                  text: '${tax['branchcode']}',
                                  style: TextStyle(
                                      color: Colors.grey), // Gray font color
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ตั้งค่าเริ่มต้น',
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      const Color.fromARGB(255, 92, 116, 250),
                                ),
                              ),
                              SizedBox(width: 8),
                              Switch(
                                value: switchStateMap[index] ?? false,
                                onChanged: (value) {
                                  setState(() {
                                    switchStateMap[index] = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            // Add space between OTP input and button
            SizedBox(
              height: 30,
            ),

// Centering the button with padding
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Add horizontal padding
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AddTaxInvoice(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 92, 116,
                      250), // Set the background color of the button
                  minimumSize: Size(double.infinity,
                      50), // Set the width to be expandable and height of the button
                ),
                child: Text('เพิ่มข้อมูลใบกำกับภาษี'),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
