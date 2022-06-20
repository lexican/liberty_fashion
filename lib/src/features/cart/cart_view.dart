import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/cart/cart_item/cart_item.dart';

import '../../core/utils/utils.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();
  final CartTotalBloc blocTotal = BlocProvider.getBloc<CartTotalBloc>();
  List<CartModel> items = [];

  Widget bottom() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "VAT",
            //       style: TextStyle(fontSize: 18, color: Color(0xFF686868)),
            //     ),
            //     Text(
            //       "5%",
            //       style: TextStyle(fontSize: 18, color: Color(0xFF686868)),
            //     )
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subtotal: ",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
                StreamBuilder(
                  stream: blocTotal.outCartTotal,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Text(
                      "\u20A6" + moneyFormat(snapshot.data.toString()),
                      style: const TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 18,
                        //fontWeight: FontWeight.w800
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: const BorderSide(color: primaryColor)),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LandingPage()),
                      // );
                    },
                    color: Colors.white,
                    textColor: primaryColor,
                    child: Text(
                      "CONTINUE SHOPPING".toUpperCase(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: const BorderSide(color: Colors.red)),
                    color: primaryColor,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AddressPage(),),);
                    },
                    child: Text(
                      "BUY".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => WishList(),),);
              },
              icon: const Icon(
                Icons.favorite,
                color: primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: primaryColor,
              ),
            )
          ],
        ),
        body: Container(
          height: size.height - kToolbarHeight - 24,
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: bloc.cartListStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    items = snapshot.data;
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) {
                          return CartItem(cartItem: items[i]);
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Your cart is currently empty',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              bottom(),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
