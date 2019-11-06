import 'package:flutter/material.dart';

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
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            RaisedButton(
              child: Text("View Entries"),
              onPressed: () {
                Navigator.push(context, viewEntries());
              }
            ),
          ],
        ),
      ],
    );
  }
}

/***** View Entry page *****
 * View contents of firebase database

 **************************/
class viewEntries extends MaterialPageRoute<Null>
{
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;
  bool _isFabMini = false;

  viewEntries()
      : super(builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: Text('Entries'),
            elevation: 1.0,
          ),

          body: Builder(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.navigation),
              mini: this._isFabMini,
              onPressed: (){

              },
            ),
          ),
        );
    });
}