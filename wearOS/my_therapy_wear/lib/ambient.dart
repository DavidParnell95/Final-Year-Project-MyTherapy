import 'package:flutter/material.dart';

class AmbientWatchFace extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text('MyTherapy', style: TextStyle(color: Colors.blue, fontSize: 30)),
        ],
      ),
    ),
    );
  }
}