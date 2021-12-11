import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionCategoryModel {
  final String id;
  final String collectionImageUrl;
  final String collectionName;

  CollectionCategoryModel({required this.id, required this.collectionImageUrl, required this.collectionName});

  factory CollectionCategoryModel.fromSnapshot(DocumentSnapshot doc) {
    Map? getDocs = doc.data() as Map?;
    return CollectionCategoryModel(
      id: doc.id,
      collectionImageUrl: getDocs!['collectionImageUrl'],
      collectionName: getDocs['collectionName']
    );
  }
}
