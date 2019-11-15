import 'package:flutter/material.dart';

class ViewEntry extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Entries', textAlign: TextAlign.center),
          ),
        )
    );

  }
}