import 'package:ev_appcharger/History/HistoryList.dart';
import 'package:ev_appcharger/Homepage/Homepage1.dart';
import 'package:ev_appcharger/Homepage/Scanqrcode.dart';
import 'package:ev_appcharger/User/UserList.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GPSMap extends StatefulWidget {
  @override
  _GPSMapState createState() => _GPSMapState();
}

class _GPSMapState extends State<GPSMap> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  List<Polyline> polylines = [];
  TextEditingController searchController = TextEditingController();
  bool isSearchOpen = false;
  LocationData? currentLocation;
  double minPowerLevel = 0; // ค่าเริ่มต้นของระดับพลังงานขั้นต่ำ
  String selectedConnectionType = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
int _currentIndex = 1;
void _navigateToPage(int index, BuildContext context) {
    Widget newPage;
    switch (index) {
      case 0:
        newPage = Homepage1();
        break;
      case 1:
        newPage = GPSMap();
        break;
      case 2:
        newPage = Scanqrcode();
        break;
      case 3:
        newPage = HistoryList();
        break;
      case 4:
        newPage = UserList(onSetThemeMode: (ThemeMode ) {  },);
        break;
      default:
        newPage = Homepage1();
        break;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('แผนที่', textAlign: TextAlign.center),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSearchOpen ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchOpen = !isSearchOpen;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                'ตัวกรอง',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // เพิ่มโค้ดสำหรับรีเซ็ตข้อมูลที่นี่
                                },
                                child: Text(
                                  'รีเซ็ต',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'ประเภทการเชื่อมต่อ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // ทำสิ่งที่ต้องการเมื่อปุ่มถูกกด
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'images/Hyundai.png',
                                      height: 20,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // ทำสิ่งที่ต้องการเมื่อปุ่มถูกกด
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'images/KIA.png',
                                      height: 20,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // ทำสิ่งที่ต้องการเมื่อปุ่มถูกกด
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'images/MG.png',
                                      height: 20,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // ทำสิ่งที่ต้องการเมื่อปุ่มถูกกด
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'images/Tesla_logo.png',
                                      height: 20,
                                      width: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'ระดับพลังงานขั้นต่ำ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Slider(
                            value: minPowerLevel,
                            onChanged: (newValue) {
                              setState(() {
                                minPowerLevel = newValue;
                              });
                            },
                            min: 0,
                            max: 100,
                            divisions: 4,
                            label: minPowerLevel.round().toString(),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'ค่าจอดรถ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text('ฟรีค่าจอดรถ'),
                                  value: 'ฟรีค่าจอดรถ',
                                  groupValue: selectedConnectionType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedConnectionType = value as String;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: RadioListTile(
                                  title: Text('มีค่าบริการ'),
                                  value: 'มีค่าบริการ',
                                  groupValue: selectedConnectionType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedConnectionType = value as String;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0,
                          ), // Add space between OTP input and button
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => SuccessRegister()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              backgroundColor: const Color.fromARGB(
                                  255,
                                  92,
                                  116,
                                  250), // Set the background color of the button
                              minimumSize: Size(400,
                                  50), // Set the width and height of the button
                            ),
                            child: Text('ยืนยัน'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: isSearchOpen,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'ค้นหาสถานที่',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _searchLocation(searchController.text);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(18.738854443887018, 98.97259058314681),
                zoom: 17,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: Set<Marker>.of(markers),
              polylines: Set<Polyline>.of(polylines),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (currentLocation != null) {
                mapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                      zoom: 17,
                    ),
                  ),
                );
              }
            },
            backgroundColor: const Color.fromARGB(255, 92, 116, 250),
            child: Icon(Icons.gps_fixed),
          ),
        ],
      ),
       bottomNavigationBar: AnimatedSwitcher(
        duration: Duration(milliseconds: 300), // กำหนดระยะเวลาของอนิเมชั่น
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: BottomNavigationBar(
          key: ValueKey<int>(_currentIndex), // ใช้ Key เพื่อระบุการเปลี่ยนแท็บ
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _navigateToPage(index, context);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'แผนที่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'สแกนQr',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'ประวัติ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'การตั้งค่า',
            ),
          ],
          backgroundColor:
              const Color.fromARGB(255, 92, 116, 250), // กำหนดสีพื้นหลัง
          selectedItemColor: const Color.fromARGB(
              255, 92, 116, 250), // กำหนดสีของไอเท็มที่เลือก
          unselectedItemColor: Colors.grey, // กำหนดสีของไอเท็มที่ไม่ได้เลือก
        ),
      ),
    );
  }

  void _searchLocation(String searchText) {
    // นำฟังก์ชันการค้นหาที่นี่
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    try {
      currentLocation = await location.getLocation();
      if (currentLocation != null) {
        markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
          ),
        );
        setState(() {});
      }
    } catch (e) {
      print('Could not get the location: $e');
    }
  }
}
