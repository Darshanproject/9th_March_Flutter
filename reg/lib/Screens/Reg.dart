import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.deepPurple),
            // margin: EdgeInsets.only(top: 80, right: 25, left: 25),
            padding: EdgeInsets.only(top: 80, right: 25, left: 25),
            child: Form(
              child: Column(
                children: [
                  TextField(
                    controller: name,
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
                    controller: surname,
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
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Email",
                      hintText: "Email",
                    ),
                    // onSaved:(val){

                    // }
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
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            if (isloading) {
                              return;
                            }
                            if (name.text.isEmpty) {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                  content: Text("Please Enter your name")));
                              return;
                            }
                            if (surname.text.isEmpty) {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                  content: Text("Please enter your surname")));
                              return;
                            }
                            if (email.text.isEmpty) {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                  content: Text("Please enter your email")));
                              return;
                            }
                            if (password.text.isEmpty ||
                                password.text.length < 6) {
                              scaffoldMessenger.showSnackBar(SnackBar(
                                  content:
                                      Text("Password should be min 6 char")));
                              return;
                            }
                            signup(
                              name.text.toString(),
                              email.text.toString(),
                              password.text.toString(),
                              surname.text.toString(),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        child: (isloading)
                            ? Center(
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              )
                            : Container(),
                        right: 30,
                        top: 0,
                        bottom: 0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(onTap: () {
                    Navigator.pushReplacementNamed(context, "Login");
                  }),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (BuildContext context) => Login_Screen()));
                  //     },
                  //     child: Text("Sigin"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signup(name, surname, email, password) async {
    setState(() {
      isloading = true;
    });
    print("Calling");
    Map data = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password
    };
    print(data.toString());
    final response = await http.post(
        Uri.parse(
            "https://database20810.000webhostapp.com/FlutterCrude/rigester.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "appliction/x-www-form-urlcoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 200) {
      setState(() {
        isloading = false;
      });
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => Login_Screen()));
    } else {
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text("Please try again later")));
    }
  }
}
