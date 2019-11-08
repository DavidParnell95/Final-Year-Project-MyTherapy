import 'package:flutter/material.dart';
import 'package:mytherapy/addEntry.dart';
import 'package:mytherapy/viewEntry.dart';

void main()
{
  runApp(new HomePage());
}

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
            onPressed: ViewEntry(),
          ),
          RaisedButton(
            child: Text("Add Entry"),
            onPressed: AddEntry(),
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

