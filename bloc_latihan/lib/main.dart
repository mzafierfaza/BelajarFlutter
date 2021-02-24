import 'package:bloc_latihan/color_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ColorBloc>(
            builder: (context) => ColorBloc(), child: MainPage()));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_light_blue);
            },
            backgroundColor: Colors.lightBlue,
          )
        ],
      ),
      appBar: AppBar(
        title: Text("BLoC dengan flutter bloc"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: currentColor),
        ),
      ),
    );
  }
}
