import 'package:flutter/material.dart';
import 'package:myapp1/Screens/edit.dart';
import 'package:myapp1/main.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Details extends StatefulWidget {
  List list;
  int index;
  Details({required this.list, required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.list[widget.index]['name']}'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              widget.list[widget.index]['name'],
              style: TextStyle(fontSize: 20),
            ),
            Text(
              widget.list[widget.index]['email'],
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
                child: Text("Edit"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                              list: widget.list, index: widget.index)));
                }),
            MaterialButton(
                child: Text("Delete"),
                onPressed: () {
                  AlertDialog alertDialog = AlertDialog(
                    content: Text("Are You Sure?"),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => MyHome()));
                          deletedata();
                        },
                        child: Text("OK"),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Cancel"),
                      )
                    ],
                  );
                  showDialog(
                      context: context, builder: (context) => alertDialog);
                })
          ],
        ),
      ),
    );
  }

  void deletedata() {
    var url = "https://database20810.000webhostapp.com/FlutterCrude/delete.php";

    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }
}
