import 'package:flutter/material.dart';

void main()
{
  runApp(new HomePage());
}

class HomePage extends StatelssWidget
{
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

        children: <String>[
          addButton();//Button 1
          //Button 2
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