import 'package:flutter/material.dart';

class diaryButton extends StatelssWidget
{
  IconColor = Colors.white;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          color: Colors.black,
          icon: Icon(Icons.book, color: IconColor),

          onPressed: ()
          {
            //Go to add entry
          },
        ),
      ),
    );
  }
}