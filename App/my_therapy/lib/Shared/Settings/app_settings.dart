import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_therapy/Shared/constants.dart';

class AppSettings extends StatefulWidget
{
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings>
{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: SettingsScreen(
          title:"App Settings",
        children: <Widget>[

          SettingsTileGroup(
            title: "Text Options",
            children: <Widget>[

              //Font Size

              //Font Color
              MaterialColorPickerSettingsTile(
                settingKey: 'font-color',
                title: 'Text Color',
                cancelCaption: 'Keep old color',
                okCaption: 'Select new',
                confirmText: 'Confirm?',
                confirmModalTitle: 'Are you Sure?',
                confirmModalCancelCaption: 'Keep the old one',
                confirmModalConfirmCaption: 'Yes, I am sure',
              )

            ],
          ),

          SettingsTileGroup(
            title: "Colors",
            children: <Widget>[

              //Dark Mode
              SwitchSettingsTile(
                settingKey: 'key-dark-mode',
                title: "Dark Mode",
                subtitle: 'On',
                subtitleIfOff: 'Off',
                icon: Icon(Icons.brightness_6, color: textColor),
              ),

              //Interface Color
              MaterialColorPickerSettingsTile(
                settingKey: 'interface-color',
                title: 'Background Color',
                cancelCaption: 'Cancel',
                okCaption: 'Confirm',
                confirmModalTitle: 'Are you sure?',
                confirmModalCancelCaption: 'Keep old color?',
                confirmModalConfirmCaption: 'Yes, I am sure',
              ),



            ],
          )
        ],

      ),
    );
  }
}