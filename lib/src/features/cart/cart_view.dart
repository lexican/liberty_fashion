import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/bloc/bloc.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/cart/cart_item/cart_item.dart';
import 'package:liberty_fashion/src/features/cart/cart_view_bottom_toolbar/cart_view_bottom_toolbar.dart';

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
                    if (snapshot.hasData) {
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
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              const CartItemBottomToolbar(),
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
