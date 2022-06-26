import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/cart_details/cart_details_view.dart';
import 'package:liberty_fashion/src/features/product_customize/product_customize_view.dart';

import '../../../core/utils/utils.dart';

class CartItem extends StatefulWidget {
  final CartModel cartItem;
  const CartItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();
  final WishListBloc wishlistbloc = BlocProvider.getBloc<WishListBloc>();

  void removeFromCart(CartModel cartItem) {
    bloc.removeFromList(cartItem);
    showToast("Product removed from cart");
  }

  void moveToWishList(CartModel cartItem) {
    bloc.removeFromList(cartItem);
    showToast("Product moved to wishlist");

    logger.i("Clicked");
    wishlistbloc.addToList(cartItem);
  }

  late CartModel cartItem;
  @override
  void initState() {
    cartItem = widget.cartItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartDetailsView(
                    cartItem: cartItem,
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            imageUrl: cartItem.product?.productImageUrl ?? '',
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
                            )),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 3),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          width: 85,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Text(
                            cartItem.collectionName == "Fabrics"
                                ? "1/1"
                                : cartItem.fabric?.name != null
                                    ? "1/2"
                                    : "1/1",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          )),
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
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              cartItem.product!.name +
                                  (cartItem.fabric != null
                                      ? (" + " + cartItem.fabric!.name)
                                      : ""),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontFamily: "SegoeUi", fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\u20A6 " +
                            moneyFormat((cartItem.product!.price +
                                    cartItem.fabric!.price)
                                .toString()),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF686868),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade100,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      moveToWishList(cartItem);
                    },
                    color: primaryColor),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductCustomizeView(
                          cart: cartItem,
                          collectionName: cartItem.collectionName ?? '',
                          mode: "Edit",
                          product: cartItem.product ?? ProductModel(),
                        ),
                      ),
                    );
                  },
                  color: primaryColor,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    removeFromCart(cartItem);
                  },
                  color: primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
