import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Models/entry.dart';

class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  //If doesnt exist, firebase will create it
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference entryCollection = Firestore.instance.collection('entries');


  Future updateUserData(String name, String accountType, String intitution) async {
    return await entryCollection.document(uid).setData({
      'Name': name,
      'Account Type': accountType,
      'Institution' : intitution
    });
  }

  //Entry list from snapshot
  List<Entry> _entryListFromSnapshot(QuerySnapshot snapshot)
  {
    //Map snapshot to an iterable
    return snapshot.documents.map((doc){
      return Entry(
        date: doc.data['date'] ?? '00/00/00',
        suds: doc.data['suds'] ?? 0,
        entry: doc.data['entry'] ?? '',
      );
    }).toList();//Map iterable to list
  }

  //Get entries stream
  Stream<List<Entry>> get entries {
    return entryCollection.snapshots().map(_entryListFromSnapshot);
  }
}