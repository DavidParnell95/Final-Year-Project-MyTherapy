import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:preferences/preference_page.dart';
import 'package:preferences/preference_title.dart';
import 'package:preferences/preferences.dart';
import 'package:theme_provider/theme_provider.dart';



class SettingsPage extends StatefulWidget
{
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<SettingsPage> {

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
                RadioPreference('16', '16', 'font_size_pref'),
                RadioPreference('18', '18', 'font_size_pref'),
                RadioPreference('20', '20', 'font_size_pref'),
                RadioPreference('22', '22', 'font_size_pref'),
                RadioPreference('24', '24', 'font_size_pref'),
                RadioPreference('26', '26', 'font_size_pref'),
                RadioPreference('28', '28', 'font_size_pref'),
                RadioPreference('30', '30', 'font_size_pref'),
              ],
              title: "Select font size",
              submitText: "Save",
              cancelText: "Cancel",
              onlySaveOnSubmit: true,
            ),
          ),
        ),

        SizedBox(height: spacing),

        PreferenceTitle("Theme"),

        /// Default - Light Theme
        Card(
          child: RadioPreference(
            'Light Theme',
            'light',
            'ui_theme',
            isDefault: true,
            onSelect: (){
              print("Light Theme");
              ThemeProvider.controllerOf(context).setTheme("custom_theme");
            },
        ),
        ),

        /// Dark Theme
        Card(
          child: RadioPreference(
            'Dark Theme',
            'dark',
            'ui_theme',
            isDefault: false,
            onSelect: (){
              print("Dark Theme");
              ThemeProvider.controllerOf(context).setTheme("default_dark_theme");
            },
          ),
        ),

        /// Red Green Color Blind
        Card(
          child: RadioPreference(
            'Red Green colorblind',
            'rgb',
            'ui_theme',
            isDefault: false,
            onSelect: (){
              print("Red Green Colorblind Theme");
              ThemeProvider.controllerOf(context).setTheme("custom_theme_rg");
            },
          ),
        ),


      ]
      ),
    );
  }
}

