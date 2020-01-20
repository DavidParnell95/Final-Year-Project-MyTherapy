//Responsible for outputting entries

import 'package:flutter/material.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:provider/provider.dart';

class EntryList extends StatefulWidget{
  @override
  _EntryListState createState() => _EntryListState();
}

class _EntryListState extends State<EntryList>
{
  @override
  Widget build(BuildContext context) {

    final entries = Provider.of<List<Entry>>(context);

    //Print found entries to console
    entries.forEach((entry){
      print(entry.date);
      print(entry.suds);
      print(entry.entry);
    });

    return Container(


    );
  }
}