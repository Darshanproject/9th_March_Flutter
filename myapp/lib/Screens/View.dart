import 'package:flutter/material.dart';
import 'package:myapp/Screens/Add.dart';

class View_Screen extends StatefulWidget {
  const View_Screen({super.key});

  @override
  State<View_Screen> createState() => _View_ScreenState();
}

class _View_ScreenState extends State<View_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Add_Screen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
