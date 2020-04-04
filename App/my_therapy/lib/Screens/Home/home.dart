import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/Analytics/analytics.dart';
import 'package:my_therapy/Screens/Entries/view_entries.dart';
import 'package:my_therapy/Shared/Settings/settings_page.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Screens/Entries/add_entry.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Shared/Settings/settings_page.dart';
import 'package:theme_provider/theme_provider.dart';

class Home extends StatelessWidget
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text(
              "Logout",
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
            SizedBox(height: 40),

            Text(
              "Welcome to MyTherapy",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.only(top: 50,left: 20 ,right: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //View Entries
                      SizedBox(
                        height: 150,
                        width: 150,

                        child: FlatButton.icon(
                            color: Colors.lightBlue,
                            icon: Icon(Icons.description, color: buttonText),
                            label: Text(
                              "View Entries",
                              style: TextStyle(color: buttonText),
                            ),

                            //Button shape
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),

                            onPressed: (){
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(builder: (ctxt) => ThemeConsumer(
                                    child: ViewEntries())
                                  )
                              );
                            }
                        ),
                      ),

                      //Add Entry
                      SizedBox(width: 45),
                      SizedBox(

                          height: 150,
                          width: 150,

                          child: FlatButton.icon(
                            icon: Icon(Icons.note_add),
                            label: Text(
                              "Add Entry",
                            ),

                            //Button shape
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            onPressed: (){
                              //Navigate to Add Entry
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (ctxt) => ThemeConsumer(
                                      child: AddEntry())
                                ),
                              );
                            },
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 50),

                  Row(
                    children: <Widget>[
                      //Settings
                      SizedBox(
                        height: 150,
                        width: 150,

                        child: FlatButton.icon(
                          color: Colors.lightBlue,
                          icon: Icon(Icons.settings,color: buttonText),
                          label: Text(
                            "Settings",
                            style: TextStyle(color: buttonText),
                          ),

                          //Button shape
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (ctxt) => ThemeConsumer(
                                      child: SettingsPage()
                                  )
                              ),
                            );
                          },
                        ),
                      ),

                      //analytics button
                      SizedBox(width: 45),
                      SizedBox(
                        height: 150,
                        width: 150,

                        child: FlatButton.icon(
                          color: Colors.lightBlue,
                          icon: Icon(Icons.assessment,color: buttonText),
                          label: Text(
                            "Analytics",
                            style: TextStyle(color: buttonText),
                          ),

                          //Button shape
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)
                          ),
                          onPressed: (){
                            Navigator.push(context,
                                new MaterialPageRoute(
                                    builder: (ctxt) => ThemeConsumer(
                                        child: Analytics()
                                    )
                                )
                            );
                          },
                        ),
                      ),
                    ],),
                ],
              ),
            ),
            ],
        ),
      ),

    ),
    );
  }
}