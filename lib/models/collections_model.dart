import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionsModel {
  CollectionsModel(
      {required this.collectionCategoryId,
      required this.createDate,
      required this.description,
      required this.id,
      required this.name,
      required this.shortDescription,
      required this.productImageUrl});

  String collectionCategoryId;
  DateTime createDate;
  String description;
  String id;
  String name;
  String shortDescription;
  String productImageUrl;

  factory CollectionsModel.fromSnapshot(DocumentSnapshot doc) {
    Map? getDocs = doc.data() as Map?;
    return CollectionsModel(
      collectionCategoryId: getDocs!['collectionCategoryId'],
      createDate: getDocs['createDate'],
      description: getDocs['description'],
      id: doc.id,
      name: getDocs['name'],
      shortDescription: getDocs['shortDescription'],
      productImageUrl: getDocs['productImageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "collectionCategoryId": collectionCategoryId,
        "createDate": createDate.toIso8601String(),
        "description": description,
        "id": id,
        "name": name,
        "shortDescription": shortDescription,
        "productImageUrl": productImageUrl
      };
}
