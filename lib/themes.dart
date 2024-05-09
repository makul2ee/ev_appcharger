import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 92, 116, 250),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  // เพิ่มการตั้งค่าธีมอื่น ๆ สำหรับโหมด Light
);

final ThemeData darkTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 92, 116, 250),
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  // เพิ่มการตั้งค่าธีมอื่น ๆ สำหรับโหมด Dark
);
