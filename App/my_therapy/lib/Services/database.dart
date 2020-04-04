import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_therapy/Models/entry.dart';

class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});

  /***** Collection Ref *****/
  //Stores user data
  final CollectionReference userCollection = Firestore.instance.collection('users');
  //Store entry data
  final CollectionReference entryCollection = Firestore.instance.collection('entries');

  //User Data
  Future<void> updateUserData(String name, String instAddrress, String institution ) async{
    return await userCollection.document(uid).setData({
      'name' : name,
      'instAddress' : instAddrress,
      'institution' : institution,
    });
  }

  //Get user stream
  Stream<QuerySnapshot> get users
  {
    return userCollection.snapshots();
  }

  //Entry Data
  Future<void> updateEntryData(String date, String entry, int suds, String uid) async{
    return await entryCollection.document(date).setData({
      'date' : date,
      'suds' : suds,
      'entry' : entry,
      'uid' : uid
    });
  }

  /***** Entry List from Snapshot *****/
  //Returns a iterable containing several entries from the collection
  List<Entry> _entryListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      //print (doc.data)

      //Return single entry for object
      return Entry(
        date: doc.data['date'] ?? '',
        suds: doc.data['suds'] ?? 5,
        entry: doc.data['entry'] ?? ''
      );
    }).toList();//Convert to a list
  }

  //Get entry stream
  Stream<List<Entry>> get entries
  {
    return entryCollection.snapshots()
        .map(_entryListFromSnapshot);
  }

  /***** Add Entry *****/
  Future<void> addEntry(String newDate, int newSuds, String newEntry) async{
    return await entryCollection.document().setData({
      'date' : newDate,
      'suds' : newSuds,
      'entry' : newEntry
    });
  }
  
}