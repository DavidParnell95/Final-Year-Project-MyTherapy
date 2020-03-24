import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:my_therapy/Screens/wrapper.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Models/user.dart';

import 'package:provider/provider.dart';

//Initializes Settings
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init(prefix: 'pref_');

  PrefService.setDefaultValues({'user_description': 'This is my description!'});

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("main");

    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data:  (brightness) => new ThemeData(brightness: brightness, accentColor: Colors.blue),
      themedWidgetBuilder: (context, theme){
        return StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
            theme: theme,
            home: Wrapper(),
          ),
        );
      },
    );
  }
}
