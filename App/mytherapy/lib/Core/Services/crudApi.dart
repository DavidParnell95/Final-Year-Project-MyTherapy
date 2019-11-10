import 'package:cloud_firestore/cloud_firestore.dart';

/***** Handles Crud operations
 * This class will handle the different database CRUD operations
 * that will be performed (Create, Read, Update but not delete)
 */

class CrudApi
{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  CrudApi(this.path)
  {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection()
  {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection()
  {
    return ref.snapshots();
  }

  //Search by Date
  Future<DocumentSnapshot> getEntryByDate(String date)
  {
    return ref.document(date).get();
  }

  //Add new Entry
  Future<DocumentReference> addEntry(Map data, String date)
  {
    return ref.document(date).updateData(data);
  }
}