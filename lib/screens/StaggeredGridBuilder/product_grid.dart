import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:liberty_fashion/models/product_model.dart';
import 'package:liberty_fashion/widgets/product_card/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.products, required this.title}): super(key: key);

  final List<Product> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          product: products[index], title: title
        );
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
