import 'package:flutter/material.dart';
import 'package:reg/Screens/Login.dart';

class Reg_Screen extends StatefulWidget {
  const Reg_Screen({super.key});

  @override
  State<Reg_Screen> createState() => _Reg_ScreenState();
}

class _Reg_ScreenState extends State<Reg_Screen> {
  bool isloading = false;
  void display() {
    if (isloading = false) {
      isloading == true;
    } else {
      isloading = false;
    }
    print("Working");
  }

  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.deepPurple),
        // margin: EdgeInsets.only(top: 80, right: 25, left: 25),
        padding: EdgeInsets.only(top: 80, right: 25, left: 25),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Name",
                  hintText: "Name"),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Surname",
                  hintText: "Surname"),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: id,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Email",
                  hintText: "Email"),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Password",
                  hintText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        display();
                      },
                      icon: (isloading = true)
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.crop_square_sharp))),
              obscureText: isloading,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Login_Screen()));
                },
                child: Text("Sigin"))
          ],
        ),
      ),
    );
  }
}
