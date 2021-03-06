/**** Loading Class *****
 * Class to display loading animation while time consuming
 * operations are underway
 *************************/

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.indigo[900],
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}