import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_therapy_app/Models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) :null;
  }

  //auth change user stream, listens for auth changes
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //Anon Sign in
  Future signInAnon() async
  {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }

    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //Email & Password sign in

  //Apply

  //Log out
}