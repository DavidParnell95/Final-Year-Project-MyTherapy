import 'package:flutter/material.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:my_therapy/Services/auth.dart';
import 'package:my_therapy/Services/database.dart';
import 'package:my_therapy/Shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:my_therapy/Screens/Entries/entry_list.dart';


class ViewEntries extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Entry>>.value(
        value: DatabaseService().entries,
        child: Scaffold(
          //App Bar
          appBar: AppBar(
            title: Text(
                'Entries',
                style: TextStyle(color: textColor)
            ),

          ),

          body: EntryList(),

        )
    );
  }


}