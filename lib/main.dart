import 'package:ev_appcharger/Login/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'themes.dart'; // นำเข้าไฟล์ themes.dart
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // กำหนดค่าเริ่มต้นให้ระบบจัดการธีม

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
      _saveThemePreference(themeMode);
    });
  }

  Future<void> _saveThemePreference(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = themeMode == ThemeMode.dark;
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'EV App',
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: _themeMode,
    home: LoginScreen(), // ใช้หน้า LoginScreen เป็นหน้าแรก
  );
}
}
