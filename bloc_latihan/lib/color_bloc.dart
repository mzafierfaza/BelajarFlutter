import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent {
  to_amber,
  to_light_blue
} // enum untuk membuat jenis-jenis color event

class ColorBloc {
  Color _color = Colors.amber; // color pertama x amber
  // _color private gakbisa di akses dari luar
  StreamController<ColorEvent> _eventController = // event = Output
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController =
      StreamController<Color>(); // state = Input
  StreamSink<Color> get _stateSink => _stateController.sink;

  Stream<Color> get stateStream => _stateController.stream;
  // ketika UI akan memberikan event masuk lewat sink, maka stream akan masuk ke mapEvent,
  // berdasarkan color event dia akan mengubah state.

  // berfungsi sebagai prosesor.
  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_amber)
      _color = Colors.amber;
    else
      _color = Colors.lightBlue;

    _stateSink.add(_color);
  }

  // untuk menghubungkan abis dari streamcontroller lanjut ke _mapEventState
  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    // dispose untuk langsung menutup streamcontroller biar tidak makan memori
    _eventController.close();
    _stateController.close();
  }
}
