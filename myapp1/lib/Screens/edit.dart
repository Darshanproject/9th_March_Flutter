import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp1/main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController cname;
  late TextEditingController cemail;

  void editdata() {
    var url = "https://database20810.000webhostapp.com/FlutterCrude/update.php";

    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id'],
      'name': cname.text.toString(),
      'email': cemail.text.toString(),
    });
  }

  @override
  void initState() {
    cname = TextEditingController(text: widget.list[widget.index]['name']);
    cemail = TextEditingController(text: widget.list[widget.index]['email']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: cname,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Name",
              labelText: "Name",
            ),
          ),
          TextField(
            controller: cemail  ,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Email",
              labelText: "Email",
            ),
          ),
          MaterialButton(
            onPressed: () {
              editdata();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext contex) => MyHome()));
            },
            child: Text("Edit"),
          ),
        ],
      ),
    );
  }
}
