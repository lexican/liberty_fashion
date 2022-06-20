import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/product_customize/product_customize_view.dart';
import 'package:liberty_fashion/src/features/product_details_image/product_details_image.dart';

import '../../core/utils/utils.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  final CollectionCategoryModel collectionCategoryModel;

  const ProductDetails({
    Key? key,
    required this.product,
    required this.collectionCategoryModel,
  }) : super(key: key);
  @override
  _CollectionDetailsPageState createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<ProductDetails> {
  late ProductModel product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  // void moveToWishList() {
  //   print("Clicked");
  //   wishlistbloc.addToList(new CartModel(
  //       catalogId: item.catalogId,
  //       price: _price,
  //       total: _price,
  //       src: _src,
  //       productId: item.productId,
  //       name: _title,
  //       id: uuid.v1(),
  //       item: item,
  //       quantity: 1,
  //       fabricId: null,
  //       fabricName: "",
  //       fabricNoOfYards: null,
  //       fabricPrice: null,
  //       fabricSrc: "",
  //       collectionName: _collectionName));
  //   Fluttertoast.showToast(
  //       msg: "Item moved to wishlist",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: size.height - size.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsImage(
                          imageUrl: product.productImageUrl ?? "",
                        ),
                      ),
                    )
                  },
                  child: Image.network(
                    product.productImageUrl ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CartPage()));
                  },
                ),
                // Icon(
                //   Icons.more_vert,
                //   color: Parameters.primaryColor,
                // ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: size.height / 3 + 25,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            product.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        // Container(
                        //   //color: Colors.red,
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Align(
                        //       alignment: Alignment.topCenter,
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           moveToWishList();
                        //         },
                        //         child: Icon(Icons.favorite_border_sharp,
                        //             color: Color(0xffFF0080)),
                        //       )),
                        // ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        product.description ?? "",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff707070),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: dividerContainer(width: size.width),
                    ),
                    SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "\u20A6 " +
                                    moneyFormat(product.price.toString()),
                                style: const TextStyle(
                                    fontFamily: "Roboto", fontSize: 18),
                              ),
                              //Text("\u20A6" + "-3%")
                            ],
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductCustomizeView(
                                    collectionName: widget
                                        .collectionCategoryModel.collectionName,
                                    mode: "New",
                                    product: product,
                                  ),
                                ),
                              )
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                            child: const Center(
                              child: Text(
                                "PROCEED",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
