import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:liberty_fashion/api/collections.dart';
import 'package:liberty_fashion/models/collections_category_model.dart';
import 'package:liberty_fashion/models/collections_model.dart';
import 'package:liberty_fashion/widgets/product_card/product_card.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.collectionCategory})
      : super(key: key);

  final CollectionCategoryModel collectionCategory;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  CollectionsApi collectionsApi = CollectionsApi();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: collectionsApi.streamDataCollection(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<CollectionsModel> collections =
                  snapshot.data!.docs.map((DocumentSnapshot doc) {
                return CollectionsModel.fromSnapshot(doc);
              }).toList();

              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    itemCount: collections.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        collectionsModel: collections[index],
                        title: "",
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(2),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ));
            }
          } else {
            return const SizedBox(
                height: 100, child: Center(child: CircularProgressIndicator()));
          }
          return const SizedBox();
        });
  }
}
