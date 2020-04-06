import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:my_therapy/Screens/wrapper.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Models/user.dart';

import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:my_therapy/Shared/themes.dart';

//Initializes Settings
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init(prefix: 'pref_');

  PrefService.setDefaultValues({'user_description': 'This is my description!'});

  FlutterError.onError = (FlutterErrorDetails details){
    FlutterError.dumpErrorToConsole(details);
    if(kReleaseMode)
      {
        exit(1);
      }
  };

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("main");

    return new ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: true,
        themes: <AppTheme>[
          AppTheme.light(),
          AppTheme.dark(),
          customAppTheme(),
          RGBAppTheme(),
        ],

        child: StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
            home: Wrapper(),
          ),
        )
    );
  }
}
