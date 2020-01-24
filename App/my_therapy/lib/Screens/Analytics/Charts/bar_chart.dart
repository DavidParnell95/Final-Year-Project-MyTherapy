import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Screens/Analytics/entries_fromFB.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_therapy/Shared/constants.dart';


class BarChart extends StatefulWidget{

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart>
{
  //Create list to hold data and generate list
  List<charts.Series<EntriesFromFB, String>> _seriesBarData;//List of data
  List<EntriesFromFB> mydata;//Holds data retrieved from Firestore
  _generateData(mydata)
  {
    _seriesBarData = List<charts.Series<EntriesFromFB, String>>();
    _seriesBarData.add(
      charts.Series(
        //X-axis value
        domainFn: (EntriesFromFB entries, _) => entries.date.toString(),
        //Y-axis value
        measureFn: (EntriesFromFB entries, _) => entries.suds,

        id: 'Entries',
        data: mydata,//Pass data from Firestore
        labelAccessorFn: (EntriesFromFB row, _) => "${row.date}",
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context)
  {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('entries').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
        {
          return LinearProgressIndicator();
        }

        else {
          List<EntriesFromFB> entries = snapshot.data.documents
              .map((documentSnapshot) => EntriesFromFB.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, entries);
        }

      },
    );
  }

  Widget _buildChart(BuildContext context, List<EntriesFromFB> entrydata)
  {
    mydata = entrydata;
    _generateData(mydata);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'SUDs by date',
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: spacing,
              ),

              Expanded(
                child: charts.BarChart(_seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 18
                      ),
                    )
                  ],
                ),

              )

            ],
          ),
        ),
      ),
    );
  }

}