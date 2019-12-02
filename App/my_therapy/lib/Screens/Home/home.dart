import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';

class Home extends StatelessWidget
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('MyTherapy'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout') ,
            onPressed: () async{
              await _auth.logOut();
            },
          )
        ],
      ),
    );
  }
}