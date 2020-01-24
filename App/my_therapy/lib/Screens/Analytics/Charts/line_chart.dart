import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Screens/Analytics/entries_fromFB.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_therapy/Shared/constants.dart';

class LineChart extends StatefulWidget
{
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<charts.Series<EntriesFromFB, String>> _seriesLineData; //List of data
  List<EntriesFromFB> mydata; //Holds data retrieved from Firestore

  _generateData(mydata) {
    _seriesLineData = List<charts.Series<EntriesFromFB, String>>();
    _seriesLineData.add(
      charts.Series(
        //X-axis value
        domainFn: (EntriesFromFB entries, _) => entries.date.toString(),
        //Y-axis value
        measureFn: (EntriesFromFB entries, _) => entries.suds,

        id: 'Entries',
        data: mydata,
        //Pass data from Firestore
        labelAccessorFn: (EntriesFromFB row, _) => "${row.date}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('entries').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        else {
          List<EntriesFromFB> entries = snapshot.data.documents
              .map((documentSnapshot) =>
              EntriesFromFB.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, entries);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<EntriesFromFB> entrydata) {
    mydata = entrydata;
    _generateData(mydata);

    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: spacing,
                ),

                Expanded(
                  child: charts.LineChart(
                    _seriesLineData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),

                  ),
                ),
              ]
            ),
          ),
        ),
    );
  }

}