import 'package:flutter/material.dart';
import 'package:my_therapy_app/authenticate.dart';
import 'package:my_therapy_app/home_page.dart';
import 'package:provider/provider.dart';
import 'package:my_therapy_app/Models/user.dart';

class Wrapper extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //Return Home
    return Authenticate();
  }
}