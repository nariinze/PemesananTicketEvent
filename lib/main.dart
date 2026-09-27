import 'package:flutter/material.dart';

import 'Screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventPass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E70),
          surface: const Color(0xFFF7F7F2),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F7F2),
          foregroundColor: Color(0xFF18312E),
          elevation: 0,
          centerTitle: false,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF087E70),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
