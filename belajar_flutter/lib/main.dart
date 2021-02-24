import 'package:belajar_flutter/post_result_model.dart';
import 'package:belajar_flutter/user_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult;
  // deklarasi dlu awalnyo supayo otomatis null awalny
  User user;
  String output = "Belum ada kumpulan Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("HTTP API"),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text((postResult != null)
                          ? postResult.id +
                              " | " +
                              postResult.name +
                              " | " +
                              postResult.job +
                              " | " +
                              postResult.created
                          : "Tidak ada Data"),
                      RaisedButton(
                        onPressed: () {
                          PostResult.connectToAPI("Agus", "Cawa").then((value) {
                            postResult = value;
                            setState(() {});
                          });
                        },
                        child: Text("POST"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text((user != null)
                          ? user.id + " | " + user.name + " | "
                          : "Tidak ada Data"),
                      RaisedButton(
                        onPressed: () {
                          User.connectToAPI("5").then((value) {
                            user = value;
                          });
                          setState(() {});
                        },
                        child: Text("GET"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(output),
                      RaisedButton(
                        onPressed: () {
                          User.getUsers("2").then((users) {
                            output = "";
                            for (int i = 0; i < users.length; i++)
                              output = output + " [ " + users[i].name + " ] ";
                            setState(() {});
                          });
                        },
                        child: Text("GET"),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
