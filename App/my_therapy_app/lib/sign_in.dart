import 'package:flutter/material.dart';
import 'package:my_therapy_app/Services/auth.dart';
import 'package:my_therapy_app/apply.dart';

class SignIn extends StatefulWidget
{
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{

  final AuthService _authAnon = AuthService();

  //Text Field state
  String email ='';
  String password ='';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[

          //Apply button, brings to registration page
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Apply'),
              onPressed: (){
                widget.toggleView();
              }
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[

              //Email field
              SizedBox(height: 20.0,),
              TextFormField(
                //Every time typed into, value gotten
                onChanged: (val){
                  setState(() => email = val);
                },
              ),

              //Password Field
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,//Hide password
                onChanged: (val)
                {
                  setState(() => password = val);
                },
              ),

              //Sign in Button
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Sign In'),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}