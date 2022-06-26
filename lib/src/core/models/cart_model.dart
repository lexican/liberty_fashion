import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liberty_fashion/src/core/models/models.dart';

class CartModel {
  String id;
  ProductModel? product;
  ProductModel? fabric;
  String? collectionName;
  MenMeasurementModel? menMeasurement;
  WomenMeasurementModel? womenMeasurement;
  String? menStyle;
  String? womenStyle;
  int quantity;
  double fabricNoOfYards;
  String gender;

  CartModel({
    required this.id,
    this.product,
    this.fabric,
    this.collectionName,
    this.menMeasurement,
    this.womenMeasurement,
    this.menStyle,
    this.womenStyle,
    this.quantity = 1,
    this.fabricNoOfYards = 0.0,
    required this.gender,
  });

  factory CartModel.fromSnapshot(DocumentSnapshot doc) {
    Map? getDocs = doc.data() as Map?;
    return CartModel(
        id: doc.id,
        product: getDocs!['product'],
        fabric: getDocs['fabric'],
        collectionName: getDocs['collectionName'],
        menMeasurement: getDocs['menMeasurement'],
        womenMeasurement: getDocs['womenMeasurement'],
        menStyle: getDocs['menStyle'],
        womenStyle: getDocs['womenStyle'],
        quantity: getDocs['quantity'],
        fabricNoOfYards: getDocs['fabricNoOfYards'],
        gender: getDocs['gender']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "fabric": fabric,
        "collectionName": collectionName,
        "menMeasurement": menMeasurement,
        "womenMeasurement": womenMeasurement,
        "menStyle": menStyle,
        "womenStyle": womenStyle,
        "quantity": quantity,
        "fabricNoOfYards": fabricNoOfYards,
        "gender": gender
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
