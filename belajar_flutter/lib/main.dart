import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.greenAccent,
            body: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    buildCard(Icons.access_alarm,
                        "Acces Alarm"), // bisa langsung bisa pake method sendiri
                    buildCard(Icons.account_box,
                        "Account Box"), // biar enak pake method sendiri seperti skrg
                    buildCard(Icons.api, "Api"), // jadi tinggal ubah parameter
                    buildCard(Icons.sanitizer, "Sanitizer"),
                  ],
                ),
              ),
            )));
  }

  Card buildCard(IconData icon, String teks) {
    return Card(
      elevation: 10, // jarak dari background ke card
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Colors.green,
              )),
          Text(teks)
        ],
      ),
    );
  }
}
