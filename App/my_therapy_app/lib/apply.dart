import 'package:flutter/material.dart';
import 'package:my_therapy_app/Services/auth.dart';

class Apply extends StatefulWidget{

  final Function toggleView;
  Apply({this.toggleView});

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply>
{

  final _formKey = GlobalKey<FormState>();//key to track state of form
  final AuthService _auth = AuthService();

  //Text Field state
  String email ='';
  String name ='';
  String institution = '';
  String password ='';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Apply to MyTherapy'),
        actions: <Widget>[

          //Apply button, brings to registration page
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: (){
                widget.toggleView();
              }
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[

              //Email
              SizedBox(height: 20.0,),
              TextFormField(
                validator:(val) => val.isEmpty? 'Enter email' :null,
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
                validator:(val) => val.isEmpty? 'Enter Name' :null,
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
                validator:(val) => val.isEmpty? 'Enter Institution' :null,
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
                validator:(val) => val.length <6?
                'Enter password with more than 6 characters'
                    :null,
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
                  if(_formKey.currentState.validate())
                  {
                    dynamic result = await _auth.registerAdmin(
                        email, name, institution, password);
                    if(result == null)
                    {
                        setState(() => error = 'Plesse supply  valid email');
                    }
                  }
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}