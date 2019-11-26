import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTherapy',
      home: Wrapper(),
    );
  }
}
