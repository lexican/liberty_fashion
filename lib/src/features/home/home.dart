import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/api/api.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/features/cart/cart_view.dart';
import 'package:liberty_fashion/src/features/home/collection_category_card/collection_category_card.dart';
import 'package:liberty_fashion/src/features/products/products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionsCategoryApi collectionsCategoryApi = CollectionsCategoryApi();

  @override
  void initState() {
    super.initState();
  }

  void navigateToCollectionPage(collectionCategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Products(
          collectionCategory: collectionCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Fashion App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartView(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
        leading: const Icon(
          Icons.ac_unit,
          color: primaryColor,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Explore collection",
                  style: TextStyle(fontSize: 18, fontFamily: "SegoeUi"),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: StreamBuilder(
                stream: collectionsCategoryApi.streamDataCollection(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      List<CollectionCategoryModel> list =
                          snapshot.data!.docs.map((DocumentSnapshot doc) {
                        return CollectionCategoryModel.fromSnapshot(doc);
                      }).toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          childAspectRatio: (itemWidth / itemHeight),
                          controller: ScrollController(keepScrollOffset: false),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          primary: false,
                          children: list.reversed
                              .map(
                                (item) => CollectionCategoryCard(
                                  item: item,
                                  onTap: navigateToCollectionPage,
                                ),
                              )
                              .toList(),
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
            )
          ],
        ),
      ),
    );
  }
}
