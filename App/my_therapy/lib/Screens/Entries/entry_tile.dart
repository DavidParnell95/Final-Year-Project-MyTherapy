import 'package:flutter/material.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:my_therapy/Screens/Entries/edit_form.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/constants.dart' as prefix0;

class EntryTile extends StatelessWidget{

  final Entry entry;

  EntryTile({this.entry});

  @override
  Widget build(BuildContext context) {

    //Show bottom sheet for editting entry
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

        //Entry item
        child: ListTile(

          //Left side icon
          leading: Icon(
            checkMood(),
            size: 40.0,
          ),

          //Date
          title: Text(
            entry.date,
            style: TextStyle( color: textColor, fontSize: fontSize),
          ),

          //Suds
          subtitle: Text(
            entry.suds.toString(),
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),

          //Edit button
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed:()=> _showEditPanel(),
          ),

        ),
      ),
    );
  }

  //Checks suds rating and changes icon accordingly
  IconData checkMood() {
    if(entry.suds < 4)
    {
      return Icons.mood_bad;
    }

    else if(entry.suds > 6)
    {
      return Icons.mood;
    }

    else{
      return Icons.sentiment_neutral;
    }
  }
}