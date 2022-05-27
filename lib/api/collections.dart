import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionsApi {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("collections");

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> getDocumentByCategoryId(String id) {
    return ref
        .where("collectionCategoryId",
            isEqualTo: FirebaseFirestore.instance
                .collection("collectionsCategory")
                .doc(id))
        .snapshots();
  }

  Stream<QuerySnapshot> getDocumentForFabrics(String id) {
    return ref
        .where("collectionCategoryId",
            isEqualTo: FirebaseFirestore.instance
                .collection("collectionsCategory")
                .doc(id))
        .snapshots();
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
