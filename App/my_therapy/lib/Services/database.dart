import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Models/entry.dart';
import 'package:my_therapy/Models/user.dart';

class DatabaseService
{
  final String uid;
  final String date;

  DatabaseService({this.uid, this.date});


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

  //entry data from snapshot
  EntryData _entryDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return EntryData(
      date: snapshot.data['date'],
      suds: snapshot.data['suds'],
      entry: snapshot.data['entry']
    );
  }

  //Get entries stream
  Stream<List<Entry>> get entries {
    return entryCollection.snapshots().map(_entryListFromSnapshot);
  }

  //Get user document Stream
  Stream<EntryData> get entryDate
  {
    return entryCollection.document(date).snapshots()
        .map(_entryDataFromSnapshot);
  }
}