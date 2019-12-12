import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Screens/Entries/add_entry.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:toast/toast.dart';

class Home extends StatelessWidget
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MyTherapy'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: textColor),
            label: Text(
              "Logout",
              style: TextStyle(color: textColor),
            ),
            onPressed: () async{
              await _auth.logOut();
            },
          )
        ],
      ),

      body: Container(
        child:Center(
          child: Column(
          children: <Widget>[
            SizedBox(height: 30),

            //View Entries
            SizedBox(
              height: 100,
              width: 250,

              child: FlatButton.icon(
                color: Colors.lightBlue,
                icon: Icon(Icons.description, color: textColor),
                label: Text(
                  "View Entries",
                  style: TextStyle(color: textColor),
                ),

                //Button shape
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),

                onPressed: (){
                  Toast.show(
                      "UNDER CONSTRTUCTION",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM
                  );
                },
              ),
            ),

            //Add Entry
            SizedBox(height: 20),
            SizedBox(
                height: 100,
                width: 250,

                child: FlatButton.icon(
                  color: Colors.lightBlue,
                  icon: Icon(Icons.note_add, color: textColor),
                  label: Text(
                      "Add Entry",
                      style: TextStyle(color: textColor)
                  ),

                  //Button shape
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: (){
                    //Navigate to Add Entry
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (ctxt) => new AddEntry()),
                    );
                  },
                )
            ),

            //Settings
            SizedBox(height: 20),
            SizedBox(
                height: 100,
                width: 250,

                child: FlatButton.icon(
                  color: Colors.lightBlue,
                  icon: Icon(Icons.settings,color: textColor),
                  label: Text(
                    "Settings",
                    style: TextStyle(color: textColor),
                  ),

                  //Button shape
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                  ),
                  onPressed: (){
                    Toast.show(
                      "UNDER CONSTRTUCTION",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM
                    );
                  },
                ),
                ),

            //analytics button
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 250,

              child: FlatButton.icon(
                color: Colors.lightBlue,
                icon: Icon(Icons.assessment,color: textColor),
                label: Text(
                  "Analytics",
                  style: TextStyle(color: textColor),
                ),

                //Button shape
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                ),
                onPressed: (){
                  Toast.show(
                      "UNDER CONSTRTUCTION",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM
                  );
                },
              ),
            ),
          ],
        ),
      ),

    ),
    );
  }
}