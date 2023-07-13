import 'package:flutter/material.dart';
export 'view.dart';
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
