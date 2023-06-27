import 'package:flutter/material.dart';
import 'package:myapp/Screens/View.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: View_Screen(),
    );
  }
}
