import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:my_therapy/Screens/Entries/edit_form.dart';
import 'package:my_therapy/Shared/constants.dart';

class EntryTile extends StatelessWidget{

  final Entry entry;

  EntryTile({this.entry});

  @override
  Widget build(BuildContext context) {

    //Show bottom sheet for editing entry
    void _showEditPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: EditForm(),
        );
      });
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.0),

      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ExpansionTile(
          leading: Icon(
            checkMood(),
            size: 40.0,
          ),
          title: Text(entry.date + "                " +entry.suds.toString() ),
          trailing: Icon(Icons.arrow_drop_down),
          children: <Widget>[
            Text(entry.entry),
            FlatButton.icon(
                onPressed: (){
                  _showEditPanel();
                },
                icon: Icon(Icons.edit),
                label: Text("Edit")
            )
          ],
        ),

      ),
    );
  }

  //Checks suds rating and changes icon accordingly
  IconData checkMood() {
    //If sud is greater than 6
    if(entry.suds > avgSudMax)
    {
      return Icons.mood_bad;
    }

    //If sud lower than 4
    else if(entry.suds < avgSudMin)
    {
      return Icons.mood;
    }

    //more than 3, less than 7
    else{
      return Icons.sentiment_neutral;
    }
  }
}