import 'package:flutter/material.dart';
import 'package:flutter_os/screens/name_screen.dart';
import 'package:flutter_os/utils.dart';
import 'package:wear/wear.dart';

class StartScreen extends StatefulWidget
{
  //inherit toggleView from authenticate.dart
  final Function toggleView;
  StartScreen({ this.toggleView });

  @override
  _StartScreenState createState() => _StartScreenState();

}

class _StartScreenState extends State<StartScreen> {

  //Store email value
  String email = '';

  //Store password value
  String password= '';

  @override
  Widget build(BuildContext context) {
    ListView(
      padding: const EdgeInsets.all(1),
      children: <Widget>[
        ListView(
            children: <Widget>[

              //Email Box
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: 'Email',
                ),

                //Check that field isnt empty
                validator: (val) => val.isEmpty ? 'Enter an email' :null,
                //Every time the field changes, get current value
                onChanged: (val){
                  setState(() => email = val);
                },
              ),

              //Password Box
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  filled:  true,
                  labelText: 'password'
                ),

                //Check if email is <6 characters long
                validator: (val) => val.length <6 ? 'Enter a password 6+ characters long': null,

                onChanged: (val){
                  setState(() => password = val);
                },
              ),



            ],
          )
        ],
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(
        builder: (context, shape) {
          var screenSize = MediaQuery.of(context).size;
          final shape = InheritedShape.of(context).shape;
          if (shape == Shape.round) {
            // boxInsetLength requires radius, so divide by 2
            screenSize = Size(boxInsetLength(screenSize.width / 2),
                boxInsetLength(screenSize.height / 2));
          }
          var screenHeight = screenSize.height;
          var screenWidth = screenSize.width;

          return Center(
            child: Container(
              color: Colors.white,
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FlutterLogo(size: 90),
                  SizedBox(height: 20),
                  RaisedButton(
                    highlightColor: Colors.blue[900],
                    elevation: 6.0,
                    child: Text(
                      'START',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return NameScreen(screenHeight, screenWidth);
                      }));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }*/
}
