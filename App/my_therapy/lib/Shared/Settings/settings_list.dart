import 'package:flutter/material.dart';
import 'package:settings_ui/src/colors.dart';
import 'package:settings_ui/src/settings_section.dart';

class SettingsList extends StatelessWidget
{
  final List<SettingsSection> sections;

  const SettingsList({Key key, this.sections});

  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(
           itemCount: sections.length,
           itemBuilder: (context, index)
           {

           }
       ),
    )
  }
}