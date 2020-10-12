
import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:theme_provider/theme_provider.dart';

///Bright Theme
AppTheme customAppTheme(){
  return AppTheme(
    id: 'custom_theme',
    description: "Custom Color Scheme",
    data: ThemeData(
      accentColor: Colors.black,
      primaryColor: Colors.indigo[900],
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.indigo[900],
        textTheme: ButtonTextTheme.primary
      ),
      dialogBackgroundColor: Colors.white,
        textTheme: TextTheme(
            caption: TextStyle(fontSize: 14.0, color: Colors.indigo[900])
        )


    ),
  );
}

///Red Green Colorblind Theme
AppTheme RGBAppTheme()
{
  return AppTheme(
    id: 'custom_theme_rg',
    description: "RG Colorblind Theme",
    data: ThemeData(
      primaryColor: Colors.indigo[900],
      accentColor: Colors.black,
      scaffoldBackgroundColor: Colors.yellow[300],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.indigo[900],
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        caption: TextStyle(fontSize: 14.0, color: Colors.indigo[900])
      )


    ),
  );
}