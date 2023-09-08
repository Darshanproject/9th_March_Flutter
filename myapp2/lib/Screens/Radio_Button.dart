import 'package:flutter/material.dart';

class Radio_Button_Example extends StatefulWidget {
  const Radio_Button_Example({super.key});

  @override
  State<Radio_Button_Example> createState() => _Radio_Button_ExampleState();
}

class _Radio_Button_ExampleState extends State<Radio_Button_Example> {
String cars='';

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("$cars"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
          children: [
            RadioListTile(
            title: Text("M"),
              value: "Myback", groupValue: cars, onChanged: _handlechange),
             RadioListTile(
              title: Text("N"),
              value: "Nissan GT", groupValue: cars, onChanged: _handlechange),
              RadioListTile(
                title: Text("A"),
                value: "Audi", groupValue: cars, onChanged: _handlechange),
               RadioListTile(
                title: Text("G"),
                value: "GVagan", groupValue: cars, onChanged: _handlechange),
              //  Text("This is the option you chossed $cars",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)
      
          ],
        ),
      );
  }

  void _handlechange(String? value) {
    setState(() {
      cars=value!;
    });
  }
}