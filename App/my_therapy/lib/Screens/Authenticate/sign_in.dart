/***** Sign In Screen ******
 *
 *
 *
 ***************************/

import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/Authenticate/about.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/loading.dart';
import 'package:theme_provider/theme_provider.dart';

class SignIn extends StatefulWidget
{
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
        title: Text(
          'Sign In',
          style: TextStyle(color: nonComplyText),
        ),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.info_outline, color: nonComplyText,),
            label: Text(
              "info",
              style: TextStyle(color: nonComplyText),
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => ThemeConsumer(
                      child: About()
                  ))
              );
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                "Welcome to ",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(height: 12.5),
              Image(
                image: AssetImage("lib/Images/logo.png"),
              ),
              SizedBox(height: 15,),

              Text(
                "MyTherapy is a tool based on CBT to be used by therapist and patient to help enact real change.",
                style: TextStyle(fontSize: 18.0),
              ),

              //Username Field
              SizedBox(height: 50.0),
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
                color: Colors.indigo[900],
                child: Text(
                  "Sign In",
                  style: TextStyle(color: nonComplyText),
                ),

                onPressed: () async
                {
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
                style: Theme.of(context).textTheme.caption,
              ),

              SizedBox(height: 20),
              Text(
                "Note: Only patients of an approved therapist may have an account, if you do not have an account/ don't know your account details speak to your therapist",
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}

