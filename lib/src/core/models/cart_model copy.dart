// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:liberty_fashion/src/core/models/men_measurement_model.dart';
// import 'package:liberty_fashion/src/core/models/women_measurement_model.dart';

// class CartModel {
//   CartModel(
//       {required this.collectionCategoryId,
//       required this.createDate,
//       required this.description,
//       required this.id,
//       required this.name,
//       required this.shortDescription,
//       required this.productImageUrl,
//       required this.price,
//       required this.total,
//       required this.quantity,
//       required this.fabricId,
//       required this.fabricName,
//       required this.fabricNoOfYards,
//       required this.fabricSrc,
//       required this.collectionName,
//       this.menMeasurement,
//       this.womenMeasurement,
//       this.menStyle,
//       this.womenStyle,
//       this.fabricPrice});

//   dynamic collectionCategoryId;
//   dynamic createDate;
//   String description;
//   String id;
//   String name;
//   String shortDescription;
//   String productImageUrl;
//   double price;
//   double total;
//   int quantity;

//   int fabricId;
//   String fabricName;
//   double fabricNoOfYards;
//   String fabricSrc;
//   String collectionName;

//   MenMeasurementModel? menMeasurement;
//   WomenMeasurementModel? womenMeasurement;
//   double? fabricPrice;

//   String? menStyle;
//   String? womenStyle;

//   factory CartModel.fromSnapshot(DocumentSnapshot doc) {
//     Map? getDocs = doc.data() as Map?;
//     return CartModel(
//       collectionCategoryId: getDocs!['collectionCategoryId'],
//       createDate: getDocs['createDate'],
//       description: getDocs['description'],
//       id: doc.id,
//       name: getDocs['name'],
//       shortDescription: getDocs['shortDescription'],
//       productImageUrl: getDocs['productImageUrl'],
//       price: getDocs['price'],
//       total: getDocs['total'],
//       quantity: getDocs['quantity'],
//       fabricId: getDocs['fabricId'],
//       fabricName: getDocs['fabricName'],
//       fabricNoOfYards: getDocs['fabricNoOfYards'],
//       collectionName: getDocs['collectionName'],
//       menMeasurement: getDocs['menMeasurement'],
//       fabricPrice: getDocs['fabricPrice'],
//       fabricSrc: getDocs['fabricSrc'],
//       menStyle: getDocs['menStyle'],
//       womenStyle: getDocs['womenStyle'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "collectionCategoryId": collectionCategoryId,
//         "createDate": createDate,
//         "description": description,
//         "id": id,
//         "name": name,
//         "shortDescription": shortDescription,
//         "productImageUrl": productImageUrl,
//         "price": price,
//         "total": total,
//         "quantity": quantity,
//         "fabricId": fabricId,
//         "fabricName": fabricName,
//         "fabricNoOfYards": fabricNoOfYards,
//         "collectionName": collectionName,
//         "menMeasurement": menMeasurement,
//         "womenMeasurement": womenMeasurement,
//         "fabricPrice": fabricPrice,
//         "fabricSrc": fabricSrc,
//         "menStyle": menStyle,
//         "womenStyle": womenStyle
//       };
// }
