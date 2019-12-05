import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  //If doesnt exist, firebase will create it
  final CollectionReference entryCollection = Firestore.instance.collection('users');

  Future updateUserData(String sugars, String name, int suds) async {
    return await entryCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'suds': suds,
    });
  }
}