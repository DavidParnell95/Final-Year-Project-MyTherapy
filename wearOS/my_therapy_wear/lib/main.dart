import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

import 'package:my_therapy_wear/ambient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTherapy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: WatchScreen(),
    );
  }
}

class WatchScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) => WatchShape(
    builder: (context, shape) => InheritedShape(
      shape: shape,
      child: AmbientMode(
        builder: (context, mode) =>
        mode == Mode.active ? null : AmbientWatchFace(),
      ),
    ),
  );
}