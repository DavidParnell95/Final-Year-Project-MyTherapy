/***** Sign In Screen ******
 *
 *
 *
 ***************************/

import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/loading.dart';

class SignIn extends StatefulWidget
{
  //inherit toggleView from authenticate.dart
  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn>
{
  //auth service instance
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Store email value
  String email = '';

  //Store password value
  String password= '';

  String error = '';

  @override
  Widget build(BuildContext context) {

    //If loading show animation, otherwise show sign in form
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
        style: TextStyle(color: Colors.white),
        ),

        actions: <Widget>[

          //switch to register
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () =>widget.toggleView(),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        //
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              //Username field
              SizedBox(height: 20.0),
              TextFormField(

                //Copy styling from shared file
                decoration: textInputDecoration.copyWith(hintText: 'Email'),

                //Check that field isnt empty
                validator: (val) => val.isEmpty ? 'Enter an email' :null,
                //Every time the field changes, get current value
                onChanged: (val){
                  setState(() => email = val);
                },
              ),

              //Password Field
              SizedBox(height: 20.0),
              TextFormField(

                //Import styling from shared file
                decoration: textInputDecoration.copyWith(hintText: 'Password'),

                obscureText: true,//Hide text

                //Check if email is <6 characters long
                validator: (val) => val.length <6 ? 'Enter a password 6+ characters long': null,

                onChanged: (val){
                  setState(() => password = val);
                },
              ),

              //Log in button
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.lightBlue,
                child: Text(
                  "Sign In",
                    style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{

                  //Check if entered info is valid
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading = true);//If valid show loading animation
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                    if(result == null)
                    {
                        setState(() {
                          error = 'Incorrect email or password';
                          loading = false;
                        });
                    }
                  }
                  print(email);
                  print(password);

                },
              ),

              //Error Message
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize:  14.0),
              ),

            ],
          ),
        ),
      ),
    );
  }
}