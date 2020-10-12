import 'package:flutter/material.dart';
import 'package:my_therapy/Models/user.dart';
import 'package:my_therapy/Screens/Authenticate/authenticate.dart';
import 'package:my_therapy/Screens/Home/home.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Access user data from provider
    final user = Provider.of<User>(context);

    // If valid user not logged in, show sign in screen
    if(user == null)
    {
      print("NO USER");
      return Home();
      //return Authenticate();
    }

    else if(user.uid == null)
      {
        print("NO UID!!");
        return Home();
        //return Authenticate();
      }

    else{
      print("Logged in userID:  " + user.uid);
      return Home();
    }
  }
}