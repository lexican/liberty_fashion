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

    // collectionsApi.addDocument(
    //   {
    //     "collectionCategoryId":
    //         FirebaseFirestore.instance.collection("collectionsCategory").doc(
    //               widget.collectionCategory.id,
    //             ),
    //     "createDate": DateTime.now().millisecondsSinceEpoch,
    //     "description":
    //         "Create an atmostphere of effortless vintage charm by whipping up a few new projects to scatter about your home. Lost & Found 2 by My Mind's Eye for",
    //     "productImageUrl":
    //         "https://res.cloudinary.com/kunlexze/image/upload/v1648417865/58a6e3c367c44396ad6d8dc797961095_pkn50z.jpg",
    //     "shortDescription": "Designer Tidbits: My Mind's Eye"
    //   },
    // );

