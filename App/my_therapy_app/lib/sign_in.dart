import 'package:flutter/material.dart';
import 'package:my_therapy_app/Services/auth.dart';

class SignIn extends StatefulWidget
{
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{

  final AuthService _authAnon = AuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign In'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async{
            dynamic SignInResult = await _authAnon.signInAnon();

            //Check if sign in was successful
            //SIGN NOT SUCCESSFUL
            if(SignInResult == null)
            {
                print('Error signing in');
            }
            // SIGN IN SUCCESSFUL
            else{
              print(SignInResult.uid + '  signed in');
            }
          },
        ),
      ),
    );
  }
}