//New Entry Form

import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:intl/intl.dart';
import 'package:my_therapy/Shared/constants.dart';

class AddEntry extends StatefulWidget
{
  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry>{

  //auth service instance
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Field state values
  static DateTime now = new DateTime.now();
  String date = DateFormat('yyyy-MM-dd - kk:mm').format(now);

  int sud;
  String _dropSelected;

  String entry = "";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Entry',
          style: TextStyle(color: buttonText),
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,

          //Scroll view to prevent overflow
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                //Date
                SizedBox(height: 5.0),
                ListTile(
                  title: Text('Date: '),
                  trailing: Text(
                    '$date'
                  ),
                ),

                //suds
                SizedBox(height: 1.0),
                ListTile(
                  title: Text("SUDs"),
                  trailing: DropdownButton(
                    value: _dropSelected,
                    hint: Text("SUDs:"),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropSelected = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four','Five',
                      'Six', 'Seven', 'Eight','Nine','Ten']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },).toList(),
                  ),
                  ),

                //entry
                SizedBox(height: 1.0),
                ListTile(title: Text("Entry:")),
                TextFormField(
                  decoration: entryInputDecoration.copyWith(hintText: "How was your day?"),
                  maxLines: 10,
                ),

                Center(
                  child: RaisedButton(
                    child: Text("Add Entry",style: TextStyle(color: textColor),),
                    color: buttonColor,
                    onPressed: (){},
                  ),
                )


                ]),
          ),
        ),
    ),
    );
  }
}