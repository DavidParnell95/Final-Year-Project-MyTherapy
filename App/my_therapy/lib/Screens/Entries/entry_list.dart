//Responsible for outputting entries

import 'package:flutter/material.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:provider/provider.dart';

import 'entry_tile.dart';

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

    return ListView.builder(
      itemCount: entries.length,//Number of items

      //Function that returns widgets for each item
      itemBuilder: (context, index){
        return EntryTile(entry: entries[index]);
      },//End item builder

    );
  }
}