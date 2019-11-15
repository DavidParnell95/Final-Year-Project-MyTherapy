import 'package:flutter/material.dart';
import 'package:my_therapy_app/Services/auth.dart';
import 'package:my_therapy_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:my_therapy_app/Models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Actively listens to stream in AuthService for changes
    return StreamProvider<User>.value(
      value: AuthService().user,//What to listen to
      child: MaterialApp(
        title: 'MyTherapy',
        home: Wrapper(),
      ),
    );
  }
}
