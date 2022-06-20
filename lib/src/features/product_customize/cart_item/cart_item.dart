import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/models/product_model.dart';

import '../../../core/utils/utils.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;
  final ProductModel fabric;
  final String collectionName;
  const CartItem(
      {Key? key,
      required this.product,
      required this.fabric,
      required this.collectionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productName = product.name;
    String fabricName = fabric.name;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: 85,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: product.productImageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 85,
                      height: 120,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Container(
                        color: Colors.white,
                        height: 150,
                      ),
                    ),
                    fadeOutDuration: const Duration(seconds: 1),
                    fadeInDuration: const Duration(seconds: 3),
                  ),
                ),
              ),
              (collectionName == "Fabrics")
                  ? Container(
                      alignment: Alignment.bottomLeft,
                      width: 85,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: const Text(
                        "1/1",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )
                  : Container(
                      alignment: Alignment.bottomLeft,
                      width: 85,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        fabric.name != '' ? "1/2" : "1/1",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                collectionName == "Fabrics"
                    ? Text(
                        fabric.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: "SegoeUi",
                          fontSize: 14,
                        ),
                      )
                    : Text(
                        productName +
                            (fabricName != "" ? (" + " + fabricName) : ""),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: "SegoeUi",
                          fontSize: 14,
                        ),
                      ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "\u20A6 " +
                      moneyFormat(fabric.price != null
                          ? (product.price + fabric.price).toString()
                          : product.price.toString()),
                  style: const TextStyle(
                    fontFamily: "SegoeUi",
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
