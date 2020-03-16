import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';

class Settings extends StatefulWidget{
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<Settings>
{
  int _selectedOption = 0;

  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      backgroundColor: Color(0xFFFFFF),

      //App Bar
      appBar: AppBar(
        title: Text('Settings'),
        leading: FlatButton(
          textColor: buttonColor,
          child: Icon(Icons.arrow_back),
          onPressed: () => print("Back"),
        ),
      ),
    );
  }
}