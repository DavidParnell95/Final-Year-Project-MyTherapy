import 'package:flutter/material.dart';
import 'package:my_therapy_app/Services/auth.dart';

class Apply extends StatefulWidget{
  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply>
{

  final AuthService _auth = AuthService();

  //Text Field state
  String email ='';
  String name ='';
  String institution = '';
  String password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Apply to MyTherapy'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[

              //Email
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                //Every time typed into, value gotten
                onChanged: (val){
                  setState(() => email = val);
                },
              ),

              //Name
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name'
                ),
                //Every time typed into, value gotten
                onChanged: (val){
                  setState(() => name = val);
                },
              ),

              //Institution
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Institution'
                ),
                //Every time typed into, value gotten
                onChanged: (val){
                  setState(() => institution = val);
                },
              ),

              //Password
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,//Hide password
                onChanged: (val)
                {
                  setState(() => password = val);
                },
              ),

              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Apply'),
                onPressed: () async{
                  print(email);
                  print(name);
                  print(institution);
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