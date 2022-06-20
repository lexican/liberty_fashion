import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:liberty_fashion/src/core/api/api.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/cart/cart_view.dart';

import '../../core/utils/utils.dart';
import 'product_card/product_card.dart';

class Products extends StatefulWidget {
  final CollectionCategoryModel collectionCategory;

  const Products({Key? key, required this.collectionCategory})
      : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  CollectionsApi collectionsApi = CollectionsApi();

  String getAppBarTitle() {
    if (widget.collectionCategory.collectionName != "Fabrics") {
      return widget.collectionCategory.collectionName + "'s Collections";
    }
    return "Fabrics";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            getAppBarTitle(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: StreamBuilder(
          stream: collectionsApi
              .getDocumentByCategoryId(widget.collectionCategory.id),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<ProductModel> collections =
                    snapshot.data!.docs.map((DocumentSnapshot doc) {
                  return ProductModel.fromSnapshot(doc);
                }).toList();

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: false,
                    crossAxisCount: 4,
                    itemCount: collections.length,
                    controller: ScrollController(keepScrollOffset: false),
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    primary: false,
                    itemBuilder: (_, int index) {
                      return ProductCard(
                        product: collections[index],
                        title: "",
                        collectionCategoryModel: widget.collectionCategory,
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(2),
                  ),
                );
              }
            } else {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
