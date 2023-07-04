import 'package:flutter/material.dart';
import 'package:myapp1/Screens/details.dart';
// ignore: duplicate_import
import 'details.dart';

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
          title: Text(list[i]["name"]),
          subtitle: Text(list[i]["email"]),
          leading: Text(list[i]["id"]),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext contex) => Details(list: list, index: i))),
        );
      },
    );
  }
}
