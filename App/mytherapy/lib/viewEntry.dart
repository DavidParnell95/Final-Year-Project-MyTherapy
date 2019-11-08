import 'package:flutter/material.dart';

class ViewEntry extends StatefulWidget
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

    return null;
  }
}