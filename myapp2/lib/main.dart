import 'package:flutter/material.dart';
import 'package:myapp2/Screens/InkWell.dart';
import 'package:myapp2/Screens/Radio_Button.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomColorApp(),
    );
  }
}