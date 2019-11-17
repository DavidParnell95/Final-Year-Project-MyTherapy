import 'package:flutter/material.dart';
import 'package:my_therapy_app/apply.dart';
import 'package:my_therapy_app/sign_in.dart';

class Authenticate extends StatefulWidget{

  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>
{
  bool showSignIn = true;
  void toggleView(){
    //set to reverse of what it currently is
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else{
      return Apply(toggleView: toggleView);
    }

  }
}