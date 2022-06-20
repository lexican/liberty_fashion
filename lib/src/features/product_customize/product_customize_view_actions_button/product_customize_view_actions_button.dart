import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/models/product_model.dart';
import 'package:liberty_fashion/src/core/widgets/buttons/liberty_fashion_button.dart';

import '../../../core/utils/utils.dart';

class ProductCustomizeViewActionsButton extends StatelessWidget {
  final String mode;
  final String collectionName;
  final Function(ProductModel) addToCart;
  final ProductModel fabric;
  final ProductModel product;
  final double numberOfYards;
  const ProductCustomizeViewActionsButton(
      {Key? key,
      required this.mode,
      required this.collectionName,
      required this.addToCart,
      required this.fabric,
      required this.numberOfYards,
      required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: LibertyFashionButton.outline(
              buttonText: 'CONTINUE SHOPPING',
              onPressed: () {},
              buttonBackgroundColor: Colors.white,
              buttonTextColor: primaryColor,
              buttonTextFontSize: 14,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: LibertyFashionButton(
              buttonText: mode == "New" ? "ADD TO CART" : "Update",
              onPressed: () {
                if (collectionName == "Fabric") {
                  addToCart(fabric);
                } else {
                  if (fabric.name == '') {
                    showToast("No Fabric selected",
                        backgroundColor: Colors.red);
                  } else if (numberOfYards > 12) {
                    showToast("Maximun number of yards is 12",
                        backgroundColor: Colors.red);
                  } else if (numberOfYards < 4) {
                    showToast("Minimun number of yards is 4",
                        backgroundColor: Colors.red);
                  } else {
                    addToCart(product);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
