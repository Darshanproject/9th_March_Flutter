import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Screens/AddData.dart';
import 'Screens/details.dart';

void main() {
  runApp(MaterialApp(
      title: "Online database Example",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  Future<List> getdata() async {
    final response = await http.get(Uri.parse(
        "https://database20810.000webhostapp.com/FlutterCrude/view.php"));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json Parsing"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AddData())),
          child: Icon(Icons.add),
        ),
        body: FutureBuilder<List>(
          future: getdata(),
          builder: (ctx, ss) {
            if (ss.hasError) {
              print("Error");
            }
            if (ss.hasData) {
              return Items(list: ss.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
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
        itemBuilder: (ctx, i) {
          return ListTile(
            //leading: Icon(Icons.message),
            title: Text(list[i]["name"]),

            subtitle: Text(list[i]["email"]),
            leading: Text(list[i]["id"]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Details(list: list, index: i))),
          );
        });
  }
}
