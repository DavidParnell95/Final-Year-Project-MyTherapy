import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/constants.dart' as prefix0;
import 'package:my_therapy/Shared/loading.dart';

class Register extends StatefulWidget
{
  //inherit toggleView from authenticate.dart
  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
{

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();//Key used to ID form
  bool loading = false;

  //Store email value
  String email = '';

  //Store password value
  String password= '';

  String error ='';//Error message


  @override
  Widget build(BuildContext context) {

    //If loading show loading screen, otherwise show Register Page
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Apply to MyTherapy',
          style: TextStyle(color: buttonText),
        ),

        actions: <Widget>[

          //switch to sign in
          FlatButton.icon(
            icon: Icon(Icons.person,color: textColor),
            label: Text('Sign In', style: TextStyle(color: textColor)),
            onPressed: ()=> widget.toggleView(),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        child: Form(
          key: _formKey,//Tie form to _formKey, keeps track of form & form state
          child: Column(
            children: <Widget>[

              //Email field
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),

                //Checks if empty
                validator: (val) => val.isEmpty ? 'Emter an email': null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),

              //Password Field
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),

                obscureText: true,

                //Check if entered password is > 6 characters long
                validator: (val) => val.length <6? 'Enter a password 6+ characters long' : null,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),

              SizedBox(height: 30.0),

              //Notice
              SizedBox(
                height: 50.0,
                width: 400.0,
                child: Text(
                  'NOTE: APPLICATION WILL NEED TO BE APPROVED BY MY THERAPY',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),


              //Register Button
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.lightBlue,
                child: Text(
                  'Register',
                  style: TextStyle(color: textColor),
                ),
                onPressed: () async{

                  //entered info is valid, if recieves all null, then valid
                  if(_formKey.currentState.validate())
                  {
                    setState(() => loading =true);
                    //Attempt sign up using entered details
                    dynamic result = await _auth.registerWithEmailAndPassword(email,password);

                    //If account not created
                    if(result == null)
                    {
                      setState(() {
                        error = 'Please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                  print(email);
                  print(password);
                },
              ),

              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}