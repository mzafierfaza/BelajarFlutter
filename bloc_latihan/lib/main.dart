import 'package:bloc_latihan/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("BLoC Tanpa Library"),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_amber);
                  },
                  backgroundColor: Colors.amber,
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                    onPressed: () {
                      bloc.eventSink.add(ColorEvent.to_light_blue);
                    },
                    backgroundColor: Colors.lightBlue)
              ],
            ),
            body: Center(
                child: StreamBuilder(
              // untuk membuild widget setiap kali dia dapatkan dari stream
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              },
            ))));
  }
}
