import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:theme_provider/theme_provider.dart';


class Analytics extends StatefulWidget
{
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics>
{
  List<charts.Series<Entry, String>> _seriesBarData;
  List<Entry> mydata;

  _generateData(mydata){
    _seriesBarData = List<charts.Series<Entry, String>>();
    _seriesBarData.add(
      charts.Series(

        //X Axis Value
        domainFn: (Entry entry, _) => entry.date,

        //Y Axis Value
        measureFn: (Entry entry, _) => entry.suds,

        colorFn: (Entry entry, _) => charts.ColorUtil.fromDartColor(
          checkTheme()
        ),
        id: 'Suds',
        data: mydata,
        labelAccessorFn: (Entry row, _) => "${row.suds}"
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analytics")),
      body: _buildBody(context),
    ) ;
  }

  //Gets Data from firestore
  Widget _buildBody(BuildContext context)
  {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('entries').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
          {
            return LinearProgressIndicator();
          }

        else{
          List<Entry> entry = snapshot.data.documents
              .map((documentSnapshot) => Entry.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, entry);
        }
      },
    );
  }//End _buildBody

  Widget _buildChart(BuildContext context, List<Entry> entrydata)
  {
    mydata = entrydata;
    _generateData(mydata);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Weekly SUDs",
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: spacing,
              ),

              Expanded(
                child: charts.BarChart(_seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Color checkTheme() {
    if(AppTheme == "default_dark_theme")
    {
      return Colors.white;
    }

    else {
      return Colors.indigo[900];
    }
  }
}