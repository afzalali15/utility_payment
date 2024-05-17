import 'package:flutter/material.dart';
import 'package:utility_payment/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Baloo2',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
