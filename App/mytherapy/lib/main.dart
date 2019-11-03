import 'package:flutter/material.dart';

void main()
{
  runApp(new HomePage());
}

class HomePage extends StatelssWidget
{
  IconColor = Colors.white;

  @override
  Widget build(BuildContext context)
  {
    return new Container(
      color: Colors.white30,
      child: new GridView.count(

        crossAxisCount: 2,//2 across
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4,0,

        children: <Button>[
          child: IconButton(
            iconSize: 32.0,
            icon: icon: Icon(Icons.book),
            tooltip: 'View Entries',
          ),//Button 1
          child: IconButton(
            iconSize: 32.0,
            icon: Icon(Icons.note_add,
                color: IconColor),
            tooltip: 'Add Entry'
          ),
          //Button 3
          //Button 4
        ].map(()
        {
          return new GridTile(
            child: new Image.network(url, fit: BoxFit.cover);
          )
        }).toList()),
      );
    )
  }
}