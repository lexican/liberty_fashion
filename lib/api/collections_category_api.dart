import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionsCategoryApi {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("collectionsCategory");

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map<String, dynamic> data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map<String, dynamic> data, String id) {
    return ref.doc(id).update(data);
  }
}
