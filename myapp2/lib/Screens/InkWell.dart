import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorApp extends StatefulWidget {
  @override
  _RandomColorAppState createState() => _RandomColorAppState();
}

class _RandomColorAppState extends State<RandomColorApp> {
  Color _randomColor = Colors.blue;

  void _changeRandomColor() {
    setState(() {
      _randomColor = _getRandomColor();
    });
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Random Color App'),
        ),
        body: Center(
          child: InkWell(
            onTap: _changeRandomColor,
            child: Container(
              
              color: _randomColor,
              child: Center(
                child: Text(
                  'Tap to Change Color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
    );
  }
}


