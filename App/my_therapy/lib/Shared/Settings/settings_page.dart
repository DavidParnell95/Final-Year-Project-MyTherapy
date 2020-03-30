import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:preferences/preference_page.dart';
import 'package:preferences/preference_title.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';



class SettingsPage extends StatefulWidget
{
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<SettingsPage>{

  ///App Bar Color
  ColorSwatch _tempMainColor;//App Bar Color
  Color _tempShadeColor;
  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  ///Background Color
  ColorSwatch _tempBGMainColor;
  Color _tempBGShadeColor;
  ColorSwatch _mainBGColor= Colors.grey;
  Color _shadeBGColor = Colors.grey[500];

  ///Font Color
  ColorSwatch _tempTXTMainColor;
  Color _tempTXTShadeColor;
  ColorSwatch _mainTXTColor = Colors.grey;
  Color _shadeTXTColor = Colors.grey[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: PreferencePage([
        PreferenceTitle("Text"),
        Card(
          child: PreferenceDialogLink(
            'Font Size',
            leading: Icon(Icons.text_fields),
            dialog: PreferenceDialog(
              [
                RadioPreference('16','16','font_size_pref'),
                RadioPreference('18','18','font_size_pref'),
                RadioPreference('20','20','font_size_pref'),
                RadioPreference('22','22','font_size_pref'),
                RadioPreference('24','24','font_size_pref'),
                RadioPreference('26','26','font_size_pref'),
                RadioPreference('28','28','font_size_pref'),
                RadioPreference('30','30','font_size_pref'),
              ],
              title: "Select font size",
              submitText: "Save",
              cancelText: "Cancel",
              onlySaveOnSubmit: true,
            ),
          ),
        ),

        SizedBox(height: spacing),

        PreferenceTitle("Colors"),
        Card(
              child: SwitchPreference(
                'Low Contrast Mode',
                'low_contrast_mode',
                defaultVal: false,
                onEnable: (){
                  print("Low Contrast Mode: ENABLED");
                  PrefService.setBool('ColoringEnabled', true);
                  DynamicTheme.of(context).setBrightness(Brightness.dark);
                },
                onDisable: (){
                  print("Low Contrast Mode: DISABLED");
                  PrefService.setBool('ColoringEnabled', false);
                  DynamicTheme.of(context).setBrightness(Brightness.light);
                },
              ),
        ),

        PreferenceHider([
          Center(
              child: Column(
                children: <Widget>[
                  Card(
                      child: FlatButton.icon(
                        padding: EdgeInsets.symmetric(horizontal: 127.5),
                        onPressed: _openPicker,
                        label: Text("App Bar Color"),
                        icon: Icon(Icons.palette),
                      )
                  ),

                  ///Background Color
                  Card(
                      child: FlatButton.icon(
                        padding: EdgeInsets.symmetric(horizontal: 115),
                        onPressed:_openBGPicker,
                        label: Text("Background Color"),
                        icon: Icon(Icons.format_color_fill),
                      )
                  ),

                  ///Text color
                  Card(
                    child: FlatButton.icon(
                      padding: EdgeInsets.symmetric(horizontal: 139),
                      onPressed: _openTXTPicker,
                      label: Text("Text Color"),
                      icon: Icon(Icons.format_color_text),
                    ),
                  )

                ],
              )
          )

        ], 'ColoringEnabled'),

    ]),
    );
  }

  /// App Bar Dialogue Boxes
  void _openPicker() async {
    _openDialog(
        "App Bar Color",
        MaterialColorPicker(
          selectedColor: _shadeColor,
          onColorChange: (color) => setState(() =>
          _tempShadeColor = color,
          ),
          onMainColorChange: (color) => setState(() => _tempMainColor = color),
          onBack: () => print("Back Pressed"),
        )
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
                setState(() => _shadeColor = _tempShadeColor);

                changeAppBarColor(_mainColor);


              },
            ),
          ],
        );
      },
    );
  }

  //Change the App Bar color
  void changeAppBarColor(color){
    DynamicTheme.of(context).setThemeData(ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: color,
    ));
    print("App Bar change to: " + color.toString());
  }

  ///Change Background Color
  void _openBGPicker() async{
    _openBGDialog(
      "Background Color",
      MaterialColorPicker(
        selectedColor: _shadeBGColor,
        onColorChange: (color) => setState(() =>
        _tempBGShadeColor = color,
        ),
        onMainColorChange: (color) => setState(() => _tempBGMainColor =color),
      )
    );
  }

  void _openBGDialog(String title, Widget content) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(6.0),
            title: Text(title),
            content: content,
            actions: [
              FlatButton(
                child: Text('CANCEL'),
                onPressed: Navigator
                    .of(context)
                    .pop,
              ),
              FlatButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() => _mainBGColor = _tempBGMainColor);
                  setState(() => _shadeBGColor = _tempBGShadeColor);

                  changeBackgroundColor(_mainBGColor);
                },
              ),
            ],
          );
        }
    );
  }

  void changeBackgroundColor(color)
  {
    DynamicTheme.of(context).setThemeData(ThemeData(
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor == Colors.indigo? Colors.red: color,
    ));
    print("Background changed to: " + color.toString());
  }


  /// Font Color
  void _openTXTPicker() async
  {
    _openTXTDialog(
      "Text Color",
      MaterialColorPicker(
        selectedColor: _shadeTXTColor,
        onColorChange: (txtColor) => setState(() =>
        _tempTXTShadeColor = txtColor),
        onMainColorChange: (txtColor) => setState(() => _tempTXTMainColor),
      )
    );
  }

  void _openTXTDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_){
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator
                  .of(context)
                  .pop,
            ),

            FlatButton(
              child: Text('Sumbit'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempBGMainColor);
                setState(() => _shadeBGColor = _tempBGShadeColor);

                changeTextColor(_mainTXTColor);
              }
            )
          ],
        );
      }
    );
  }

  void changeTextColor(TXTColor) {
    DynamicTheme.of(context).setThemeData(ThemeData(

    ));

    print("Text Color changed to: " + TXTColor.toString());
  }

  /// Font Size
  void changeFontSize()
  {
    DynamicTheme.of(context).setThemeData(ThemeData(
    ));
  }


}