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

  //Text Field state
  String email ='';
  String password ='';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign In'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                //Every time typed into, value gotten
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,//Hide password
                onChanged: (val)
                {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Sign In'),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}