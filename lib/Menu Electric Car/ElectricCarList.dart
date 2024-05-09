
import 'package:ev_appcharger/Menu%20Electric%20Car/AddElectricCar.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';

class ElectricCarList extends StatefulWidget {
  @override
  _ElectricCarListState createState() => _ElectricCarListState();
}

class _ElectricCarListState extends State<ElectricCarList> {
  // Sample data for electric cars
  final List<Map<String, String>> electricCars = [
    {
      'brand': 'Tesla',
      'model': 'Model S',
      'registration': 'ABC-1234',
    },
    {
      'brand': 'Nissan',
      'model': 'Leaf',
      'registration': 'XYZ-5678',
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
        title: Text('ข้อมูลรถยนต์ไฟฟ้า', textAlign: TextAlign.center),
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
                  'ข้อมูลรถยนต์ไฟฟ้า',
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
              itemCount: electricCars.length,
              itemBuilder: (context, index) {
                final car = electricCars[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      leading: Icon(Icons.electric_car,
                          color: const Color.fromARGB(255, 92, 116, 250)),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.branding_watermark,
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)), // Icon for brand
                                ),
                                TextSpan(
                                  text: 'ยี่ห้อรถยนต์: ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)),
                                ),
                                TextSpan(
                                  text: '${car['brand']}',
                                  style: TextStyle(
                                      color: Colors.grey), // Gray font color
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.directions_car,
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)), // Icon for model
                                ),
                                TextSpan(
                                  text: 'รุ่นรถยนต์: ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)),
                                ),
                                TextSpan(
                                  text: '${car['model']}',
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
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.confirmation_number,
                                      color: const Color.fromARGB(255, 92, 116,
                                          250)), // Icon for registration
                                ),
                                TextSpan(
                                  text: 'ทะเบียนรถยนต์: ',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 92, 116, 250)),
                                ),
                                TextSpan(
                                  text: '${car['registration']}',
                                  style: TextStyle(
                                      color: Colors.grey), // Gray font color
                                ),
                              ],
                            ),
                          ),
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
            SizedBox(
              height: 30,
            ), // Add space between OTP input and button
             Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Add horizontal padding
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AddElectricCar(),
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
                child: Text('เพิ่มข้อมูลรถยนต์ไฟฟ้า'),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
