/***** Firebase authentication *****
 * This Class handles firebase authentication
 *Including:
 * Sign In
 * Register
 * Sign Out
 **********************************/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_therapy/Models/user.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user)
  {
    //Create new user from user object
    return user != null ? User(uid: user.uid) :null;// if not null, create new user instance
  }

  //Sign in Anon
  //Async task
  Future signInAnon() async
  {
    try
    {
      //Makes request for authentication, awaits result.
      //System knows what to connect to due to the google-services.json file
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;//Resulting user becomes firebase user

      return _userFromFirebaseUser(user);//Return custom user object
    }

    //Request Failed
    catch(e)
    {
      print((e).toString());
      return null;
    }
  }

  //Sign in wuth email & password

  //Register

  //Sign Out

}

