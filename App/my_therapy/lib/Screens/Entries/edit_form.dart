import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:my_therapy/Shared/constants.dart' as prefix0;

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
    final List<String> suds = ['1','2','3','4','5','6','7','8','9','10'];

    //Form Values
    String _currentSuds;
    String _currentEntry;

    return Form(
      key: _formKey,

      child: Column(
        children: <Widget>[
          Text(
            'Edit Entry',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),

          //Date
          SizedBox(height: spacing),
          Text(
            'DATE',
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),

          //SUDS Edit
          SizedBox(height: spacing),


          //Entry Edit
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
                color: confirmColor,
                child: Text('Confirm', style: TextStyle(color: buttonText,
                    fontSize: fontSize),
                ),
                onPressed: (){

                },
              ),

              SizedBox(width: 40.0),

              //Cancel
              RaisedButton(
                color: cancelColor,
                child: Text('Cancel', style: TextStyle(color: buttonText,
                    fontSize: fontSize),
                ),
                onPressed: ()
                {

                },
              ),
            ],
          )

        ],
      ),
    );
  }
}
