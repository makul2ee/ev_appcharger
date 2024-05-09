import 'package:flutter/material.dart';

class ChargeElect extends StatefulWidget {
  @override
  _ChargeElect createState() => _ChargeElect();
}

class _ChargeElect extends State<ChargeElect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 92, 116, 250),
        title: Text('กำลังชาร์จไฟฟ้า'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
                  'รถยนต์ : Build Your Dream ATTO 3',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 92, 116, 250),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'หมายเลขทะเบียนรถยนต์ : กม.2076 เชียงราย',
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 92, 116, 250)),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/5.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        '50%',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    '00  :',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '00  :',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '00  ',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    'ชม.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Text(
                    'นาที',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  Text(
                    'วินาที',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.start,
                          color: const Color.fromARGB(255, 92, 116, 250),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ราคารวม : 37.85 บาท',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'ชาร์จไฟทั้งหมด : 4961 kw/h',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 10.0),
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
                      side: BorderSide(
                          color: const Color.fromARGB(255, 92, 116, 250)),
                      backgroundColor: const Color.fromARGB(255, 92, 116, 250),
                    ),
                    onPressed: () {
                     
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
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
