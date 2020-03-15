//New Entry Form

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:intl/intl.dart';
import 'package:my_therapy/Services/database.dart';
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
                    items: <String>['1', '2', '3', '4','5',
                      '6', '7', '8','9','10']
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

                  validator: (val) => val.isEmpty ? 'Tell me, how was your day?' : null,
                  onChanged: (val) => {
                    setState(() => entry = val)
                  }
                ),

                SizedBox(height: spacing),

                Center(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),

                      //Add Button
                      FlatButton(
                        child: Text("Add Entry",style: TextStyle(color: textColor)),
                        onPressed: (){

                          print(entry);
                          print(sud);

                          if(entry.isNotEmpty && _dropSelected != null)
                          {
                            Firestore.instance.collection('entries').add({
                              'date' : date,
                              'suds' : _dropSelected.toString(),
                              'entry' : entry,
                              'uid' : (DatabaseService().uid).toString(),
                            })
                                .then((result) =>{
                                  Navigator.pop(context),
                            }).catchError((err) => print(err));
                          }
                        },
                      ),

                      SizedBox(width: spacing),

                      //Clear Button
                      RaisedButton(
                        child: Text("Cancel", style: TextStyle(color: buttonText)),
                        color: Colors.red,
                        onPressed: (){
                          entry ="";
                          Navigator.pop(context);
                        },
                      )

                    ],
                  ),
                )


                ]),
          ),
        ),
    ),
    );
  }
}