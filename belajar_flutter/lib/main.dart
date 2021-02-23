import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tab Bar"),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.comment),
                  text: "Comments",
                ),
                Tab(
                  child: Image(image: AssetImage("images/cofee")),
                ),
                Tab(icon: Icon(Icons.computer)),
                Tab(text: "News")
              ]),
            ),
            body: TabBarView(children: [
              Center(
                child: Text(
                  "Tab 1",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  "Tab 2",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  "Tab 3",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  "Tab 4",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          )),
    );
  }
}
