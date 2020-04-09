import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';

class EditForm extends StatefulWidget
{
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm>
{
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final List<String> suds = ['1', '2', '3', '4','5', '6', '7', '8','9','10'];

    //Form Values
    String _currentSuds;
    String _currentEntry;
    String _currentDate;

    int sud;
    String _dropDownSelected;

    return Form(
      key: _formKey,

      child: Column(
        children: <Widget>[
          Text(
            'Edit Entry',
            style: TextStyle(fontSize: fontSize),
          ),

          //Date
          SizedBox(height: spacing),
          Text('Date: '),

          //SUDS Edit
          SizedBox(height: spacing),

          //TODO Fix value change not showing
          DropdownButtonFormField(
            value: _currentSuds ?? '5',
            decoration: textInputDecoration,
            items: suds.map((sud){
              return DropdownMenuItem(
                value: sud,
                child: Text('$sud'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSuds = val),
          ),



          //Entry Edit
          //TODO fix not showing updated text
          SizedBox(height: spacing),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: "Edit Entry"),
            validator: (val) => val.isEmpty ? 'Enter Entry' : null,
            onChanged: (val) => setState(() => _currentEntry = val),
          ),

          SizedBox(height: spacing),

          //Confirm, Cancel Buttons
          Row(
            children: <Widget>[
              //Confirm
              RaisedButton(
                child: Text('Update', style: TextStyle(fontSize: fontSize),
                ),
                onPressed: (){

                  print(sud);
                  print(_currentEntry);
                },
              ),

              SizedBox(width: 40.0),

              //Cancel
              RaisedButton(
                child: Text('Cancel', style: TextStyle(fontSize: fontSize),
                ),
                onPressed: () async
                {
                  Navigator.pop(context);
                },
              ),
            ],
          )

        ],
      ),
    );
  }
}
