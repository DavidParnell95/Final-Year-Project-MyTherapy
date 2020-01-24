import 'package:flutter/material.dart';
import 'package:my_therapy/Screens/Analytics/Charts/bar_chart.dart';
import 'package:my_therapy/Screens/Analytics/Charts/pie_chart.dart';
import 'package:my_therapy/Shared/constants.dart';


class Analytics extends StatefulWidget
{
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics>
{



  @override
  Widget build(BuildContext context) {

    int currentChart = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analytics',
          style: TextStyle(color: buttonText),
        ),
        elevation: 0.0,
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),

          child: Column(
            children: <Widget>[

              SizedBox(height: spacing),
              Row(
                children: <Widget>[

                  //Bar Chart
                  IconButton(
                    icon: Icon(Icons.insert_chart),
                    color: textColor,
                    onPressed: (){
                      currentChart = 0;
                    },
                  ),

                  // Line Chart
                  IconButton(
                    icon: Icon(Icons.show_chart),
                    color: textColor,
                    onPressed: (){
                      currentChart = 1;
                    },
                  ),

                  //Pie Chart
                  IconButton(
                    icon: Icon(Icons.pie_chart),
                    color: textColor,
                    onPressed: (){
                      //Change to Pie Chart
                      currentChart = 2;
                    },
                  ),


                ],
              ),

              SizedBox(height: spacing),
              Container(
                child: _checkChart(currentChart),
              ),

            ],
          ),
        ),

      ),
    );
  }

  _checkChart(int currentChart)
  {
    print('Current Chart: $currentChart');

    //Bar Chart set
    if(currentChart == 0)
    {
      print('Bar Chart');
      return BarChart();
    }

    //Line Chart
    else if(currentChart ==1)
    {
      print('Line Chart');

    }

    //Pie Chart
    else {
      print('Pie Chart');
      return PieChart();
    }
  }
}