import 'package:belajar_flutter/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          MainPage(), // harus kayak gini kalo mau pake MediaQuery, kalo gak dia akan error
    );
  }
}
