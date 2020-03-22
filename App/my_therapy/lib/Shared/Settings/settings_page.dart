import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:my_therapy/Shared/Settings/cache_provider.dart';
import 'package:my_therapy/Shared/Settings/app_settings.dart';

void initSettings()
{
  HiveCache hcache = HiveCache()..init();

  Settings.init(hcache);
}

class SettingsPage extends StatefulWidget
{
  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<SettingsPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: AppSettings(),/// Go to settings page
      ),
    );
  }

}