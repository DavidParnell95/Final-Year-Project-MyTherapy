//New Entry Form

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:intl/intl.dart';
import 'package:my_therapy/Services/database.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/themes.dart';
import 'package:theme_provider/theme_provider.dart';

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
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Card(
          margin: EdgeInsets.only(left: 1, right: 1),
          child: Form(
          key: _formKey,

          //Scroll view to prevent overflow
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
                  children: <Widget>[

                //Date
                SizedBox(height: 5.0),
                ListTile(
                    title: Text('Date: ', style: TextStyle(fontSize:  fontSize),),
                    trailing: Text(
                      '$date',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                //suds
                SizedBox(height: 1.0),
                ListTile(
                    title: Text("SUDs", style: TextStyle(fontSize: fontSize),),
                    trailing: DropdownButton(
                      value: _dropSelected,
                      hint: Text("SUDs:",
                        style: TextStyle(fontSize: fontSize),
                      ),
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

                      ListTile(title: Text("Entry:",
                        style: TextStyle(fontSize: fontSize),)
                      ),
                      TextFormField(
                          decoration: entryInputDecoration.copyWith(hintText: "How was your day?"),
                          maxLines: 10,

                          validator: (val) => val.isEmpty ? 'Tell me, how was your day?' : null,
                          onChanged: (val) => {
                            setState(() => entry = val)
                          }
                      ),

                SizedBox(height: spacing),

                Row(
                    children: <Widget>[
                      //Add Button
                      RaisedButton(
                        child: Text("Add Entry"),
                        onPressed: (){

                          print("Date: " + date);
                          print("Entry: " + entry);
                          print("Suds:  " + _dropSelected);

                          if(entry.isNotEmpty && _dropSelected != null)
                          {
                            Firestore.instance.collection('entries').add({
                              'date' : date,
                              'suds' : int.parse(_dropSelected),
                              'entry' : entry,
                              'uid' : (DatabaseService().uid).toString(),
                            }).then((result) =>{
                              Fluttertoast.showToast(
                                msg: "Entry Created",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                              ),
                              Navigator.pop(context),
                            }).catchError((err) => print(err));
                          }
                        },
                      ),

                      SizedBox(width: spacing),

                      //Clear Button
                      RaisedButton(
                        child: Text("Cancel"),
                        onPressed: (){
                          entry ="";
                          Navigator.pop(context);
                        },
                      )

                    ],
                  ),
                ])


                ),
              ),
            ),
          ),
    );
  }
}