import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp1/Screens/Add.dart';
import 'package:myapp1/Screens/View.dart';
import 'package:myapp1/Screens/details.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<List> getdata() async {
    final response = await http.get(Uri.parse(
        "https://database20810.000webhostapp.com/FlutterCrude/view.php"));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json parsing"),
      ),
      body: FutureBuilder<List>(
          future: getdata(),
          builder: (cxt, ss) {
            if (ss.hasError) {
              print("Error");
            }
            if (ss.hasData) {
              return Items(list: ss.data!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Add_Screen()));
      }),
    );
  }
}

// ignore: must_be_immutable
class Items extends StatelessWidget {
  List list;
  Items({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (cxt, i) {
        return ListTile(
          title: Text(list[i]["name"]),
          subtitle: Text(list[i]["email"]),
          leading: Text(list[i]["id"]),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  Details(list: list, index: i))),
        );
      },
    );
  }
}
