import 'package:flutter/material.dart';
import 'package:myapp/Screens/View.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext contex) => View_Screen()));
              },
              child: Text("Add Data"),
            )
          ],
        ),
      ),
    );
  }
}
