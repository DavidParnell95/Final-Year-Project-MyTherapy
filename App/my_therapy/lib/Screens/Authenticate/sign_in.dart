/***** Sign In Screen ******
 *
 *
 *
 ***************************/

import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';

class SignIn extends StatefulWidget
{
  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn>
{
  //auth service instance
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        //anonymous sign in button
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async{
            dynamic result = await _auth.signInAnon();

            //Sign in failed
            if(result == null)
            {
                print('Error signing in');
            }

            //Sign in successful
            else {
                print('signed in');
                print(result.uid);
            }
          },
        ),
      ),
    );
  }
}