/***** Firebase authentication *****
 * This Class handles firebase authentication
 *Including:
 * Sign In
 * Register
 * Sign Out
 **********************************/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_therapy/Models/user.dart';
import 'package:my_therapy/Services/database.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user)
  {
    //Create new user from user object
    return user != null ? User(uid: user.uid) :null;// if not null, create new user instance
  }

  // auth change user stream
  // Every time a user signs in/ out, get a response down this stream
  // Gets user if signed in, null if signed out
  Stream<User> get user
  {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      //Log in to firebase with email and password
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }

    catch(error)
    {
      print(error.toString());
      return null;
    }
  }

  //Sign Out
  Future logOut() async
  {
    try{
      return await _auth.signOut();
    }

    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

}

