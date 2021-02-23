import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          MyPage(), // harus kayak gini kalo mau pake MediaQuery, kalo gak dia akan error
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Query"),
      ),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text("Ini adalah Container dengan Media Querry"),
                color: Colors.red,
                // media querry akan otomatis fit dibagi dari layar android,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 4,
              ),
              Container(
                child: Text(
                    "Height dan width nya otomatis dibagi dari layar hp masing2"),
                color: Colors.blue,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ],
          ),
          (MediaQuery.of(context).orientation == Orientation.portrait)
              // ini pakai if singkat. (if) ? benar : salah
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: generateContainer(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: generateContainer(),
                )
        ],
      ),
    );
  }

  List<Widget> generateContainer() {
    return [
      Container(
        child: Text("ini otomatis jika layar orientasi layar berubah"),
        width: 80,
        height: 80,
        color: Colors.amber,
      ),
      Container(
        child: Text("maka media query akan otomatis mengubah juga "),
        width: 80,
        height: 80,
        color: Colors.green,
      ),
      Container(
        child: Text("sesuai dengan yang ditentukan"),
        width: 80,
        height: 80,
        color: Colors.purple,
      )
    ];
  }
}
