
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';

class About extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(color: nonComplyText)
        ),
        backgroundColor: Colors.indigo[900],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              "What is MyTherapy?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),
            Text(
              "MyTherapy is a therapy enhancement tool based on Cognitive Behavioral Therapy (CBT)",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 15),
            Text(
              "What is CBT?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),
            Text(
              "CBT aims to find a link between a person's thoughts, behaviour and emotions to food the root of their problems problems and help them enact real change in their lives to solve those problems.",
              style: TextStyle(fontSize: 18),
            ),
            Image(
              image: AssetImage("lib/Images/cbt.jpg"),
              height: 250.0,
              width: 250.0,
            ),

            Text(
              "So how does it work?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),
            Text(
              "Using CBT Worksheets, worksheets that can be customized to suit each individual, patients record information based on experiences relevant to the worksheet daily. At the end of the day the worksheet is save to a database that the patient and therapist can view at any time. This will help build a record of the patient progress overtime and can be represented on a graph",
              style: TextStyle(fontSize: 18),
            ),

          ],
        ),
      )
    );
  }
}