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

  ColorSwatch _tempMainColor;//App Bar Color
  Color _tempShadeColor;
  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];


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
                  DynamicTheme.of(context).setBrightness(Brightness.dark);
                },
                onDisable: (){
                  print("Low Contrast Mode: DISABLED");
                  DynamicTheme.of(context).setBrightness(Brightness.light);
                },
              ),
        ),

        ///App Bar Color
        Card(
          child: FlatButton.icon(
            onPressed: _openPicker,
            label: Text("App Bar Color"),
            icon: Icon(Icons.palette),
          )
        ),

        ///Background Color
        Card(
            child: FlatButton.icon(
              onPressed: (){},
              label: Text("Background Color"),
              icon: Icon(Icons.palette),
            )
        )
    ]),
    );
  }

  /// App Bar Dialogue Boxes
  void _openPicker() async {
    _openDialog(
        "Background Color",
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

  /// Color change functions
  //Change the App Bar color
  void changeAppBarColor(color){
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: color,
    ));
  }

  //Change Background Color
  void changeBackgroundColor(color)
  {
    DynamicTheme.of(context).setThemeData(new ThemeData(
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor == Colors.indigo? Colors.red: color,
    ));
  }

}