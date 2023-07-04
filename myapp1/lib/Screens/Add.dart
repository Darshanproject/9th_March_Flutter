import 'package:flutter/material.dart';
import 'package:myapp1/Screens/View.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 45, right: 12, left: 12),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: "Name",
                  labelText: "Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: surname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: "Surname",
                  labelText: "Surname"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: "email",
                  labelText: "email"),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.red,
              minWidth: double.maxFinite,
              onPressed: () {
                insertdata();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext contex) => MyHome()));
              },
              child: Text("Add Data"),
            )
          ],
        ),
      ),
    );
  }

  void insertdata() {
    var url = "https://database20810.000webhostapp.com/FlutterCrude/insert.php";
    http.post(Uri.parse(url), body: {
      "name": name.text.toString(),
      "surname": surname.text.toString(),
      "email": email.text.toString()
    });
  }
}
