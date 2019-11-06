import 'package:flutter/material.dart';
import 'dart:async';

//Firebase Imports
import 'package:firebase_auth/firebase_auth.dart';

var logInBTNCol = Colors.blueAccent;

class MyApp extends StatefulWidget
{
  const MyApp({Key key}) : super(key : key);

  @override
  _MyAppState createState() =>_MyAppState();
}

class _MyAppState extends State<MyApp>
{
  FirebaseUser _user;

  @override
  void initState();
  kFirebaseAuth.currentUser().then(
    (user) => setState(() => this._user = _user),
  );
}

@override
Widget build(BuildContext context)
{
  final statusText = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Text(_user == null
        ?'Please log in'
        :'Welcome "${_user.displayName}".'
    ),
  );

  //Login Button
  final LoginButton = MaterialButton(
    color: logInBTNCol,
    child: Text('Login In'),
    onPressed:null, //
  );
}
