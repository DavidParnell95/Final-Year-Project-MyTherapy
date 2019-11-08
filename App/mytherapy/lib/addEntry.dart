import 'package:flutter/material.dart';

class AddEntry extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('New Entry', textAlign: TextAlign.center,)),
      )
    );
  }
}