import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/Authenticate/authenticate.dart';
import 'package:my_therapy/Screens/Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    return Authenticate();

  }
}