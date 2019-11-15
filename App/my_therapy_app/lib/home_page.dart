import 'package:flutter/material.dart';
import 'package:my_therapy_app/add_entry.dart';
import 'package:my_therapy_app/view_entry.dart';

//*****  Home Page  *****
class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final _showSnack= () => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Under Construction'),
        duration: Duration(milliseconds: 500),
      ),
    );

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            //Home Page Title
            title: Text("MyTherapy", textAlign:  TextAlign.center),
          ),

          body: Column(children: <Widget>[
            RaisedButton(
              child: Text("View Entries"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewEntry()));
              },
            ),
            RaisedButton(
              child: Text("Add Entry"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEntry()));
              },
            ),
            RaisedButton(
              child: Text("Settings"),
              onPressed: _showSnack,
            )
          ],
          ),
        )
    );
  }
}

