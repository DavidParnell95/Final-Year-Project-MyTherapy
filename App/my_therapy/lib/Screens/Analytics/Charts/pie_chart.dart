import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Screens/Analytics/entries_fromFB.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_therapy/Shared/constants.dart';

class PieChart extends StatefulWidget
{
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>{
  //Create list to hold data and generate list
  List<charts.Series<EntriesFromFB, String>> _seriesPieData;//List of data
  List<EntriesFromFB> mydata;//Holds data retrieved from Firestore
  
  _generateData(mydata)
  {
    _seriesPieData = List<charts.Series<EntriesFromFB, String>>();
    _seriesPieData.add(
        charts.Series(
          //X-Axis 
          domainFn: (EntriesFromFB entry, _) => entry.date,
          //Y-Axis
          measureFn:  (EntriesFromFB entry, _) => entry.suds,
          
          id: 'SUDs Pie chart',
          data: mydata,
          labelAccessorFn: (EntriesFromFB row, _) => "${row.date}",
        )
    );
  }

  @override
  Widget build(BuildContext context) {
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
          List<EntriesFromFB> entry = snapshot.data.documents
              .map((documentSnapshot) => EntriesFromFB.fromMap(documentSnapshot.data))
              .toList();

          return _buildChart(context, entry);
        }

      }
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
              SizedBox(height: spacing),

              Expanded(
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),

                  behaviors: [
                    new charts.DatumLegend(
                      outsideJustification: charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 2,

                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0, top: 4.0),
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 18
                      ),
                    )
                  ],

                  defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}