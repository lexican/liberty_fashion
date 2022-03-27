import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  ProductModel(
      {required this.collectionCategoryId,
      required this.createDate,
      required this.description,
      required this.id,
      required this.name,
      required this.shortDescription,
      required this.productImageUrl,
      this.price});

  dynamic collectionCategoryId;
  dynamic createDate;
  String description;
  String id;
  String name;
  String shortDescription;
  String productImageUrl;
  dynamic price;

  factory ProductModel.fromSnapshot(DocumentSnapshot doc) {
    Map? getDocs = doc.data() as Map?;
    return ProductModel(
      collectionCategoryId: getDocs!['collectionCategoryId'],
      createDate: getDocs['createDate'],
      description: getDocs['description'],
      id: doc.id,
      name: getDocs['name'],
      shortDescription: getDocs['shortDescription'],
      productImageUrl: getDocs['productImageUrl'],
      price: getDocs['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        "collectionCategoryId": collectionCategoryId,
        "createDate": createDate.toIso8601String(),
        "description": description,
        "id": id,
        "name": name,
        "shortDescription": shortDescription,
        "productImageUrl": productImageUrl,
        "price": price
      };
}
