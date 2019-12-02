import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/Authenticate/sign_in.dart';
import 'package:my_therapy/Screens/Authenticate/register.dart';

class Authenticate extends StatefulWidget
{
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>
{
  bool showSignIn = true;//If true show sign in
  void toggleView()
  {
    //set showSignIn to the opposite of current value
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    //If showSignIn = true
    if(showSignIn)
    {
      return SignIn(toggleView: toggleView);
    }

    //If showSignIn=false
    else {
        return Register(toggleView: toggleView);
    }
  }
}

