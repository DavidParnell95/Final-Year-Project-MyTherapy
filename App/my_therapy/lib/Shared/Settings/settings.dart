import 'package:flutter/material.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget
{
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
            'Settings',
          style: TextStyle(
              color: titleColor,
          ),
        ),
      ),

      body: SettingsList(

        sections: [

          //Sizing
          SettingsSection(
            title: 'Size',
            tiles: [

              //Font Size
              SettingsTile(
                title: 'Text Size',
                leading: Icon(Icons.format_size, color: textColor),
                onTap: (){
                  //TODO FONT SIZE DROP DOWN
                },
              ),

              //Spacing
              SettingsTile(
                title: 'Spacing',
                leading: Icon(Icons.code, color: textColor),
                onTap: (){
                  //TODO SPACING DROP DOWN
                },
              )
            ],
          ),//End Sizes

          /***** Coloring ******
           * Font color
           * Button Color
           * Background Color
           *
           ********************/
          SettingsSection(
            title: 'Colors',
            tiles: [

              //Contrast Mode
              SettingsTile(
                title: 'Contrast Mode',
                leading: Icon(Icons.brightness_6 , color: textColor),
              ),

              //Font Color
              SettingsTile(
                title: 'Text Color',
                leading: Icon(Icons.format_color_text, color: textColor),
                onTap: (){
                  //TODO TEXT COLOR
                },
              ),// end font color

              //Background color
              SettingsTile(
                title: 'Background Color',
                leading: Icon(Icons.format_color_fill, color: textColor),
                onTap: (){
                  //TODO BACKGROUND COLOR
                },
              ),

              //Button Color
              SettingsTile(
                title: 'Button Color',
                leading: Icon(Icons.color_lens, color: textColor) ,
                onTap: (){
                  //TODO BUTTON COLOR
                },
              ),
            ]//End colorings,

          )
        ],
      ),
    );
  }
}