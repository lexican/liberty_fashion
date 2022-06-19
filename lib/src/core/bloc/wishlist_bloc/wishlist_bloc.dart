import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:liberty_fashion/src/core/bloc/wishlist_bloc/wishlist_provider.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/utils.dart';

class WishListBloc extends BlocBase {
  WishListBloc();

//Stream that receives a number and changes the count;
  final _listController = BehaviorSubject<List<CartModel>>.seeded([]);

  WishListProvider provider = WishListProvider();

//output
  Stream<List<CartModel>> get cartListStream => _listController.stream;
//input
  Sink<List<CartModel>> get cartListSink => _listController.sink;

  double cartTotal = 0.0;

  //Business Logic

  void addToList(CartModel cartItem) {
    cartListSink.add(provider.addToList(cartItem));
    logger.i('wishList length: ' + provider.getCartList().length.toString());
    notifyListeners();
  }

  void removeFromList(CartModel cartItem) {
    cartListSink.add(provider.removeFromList(cartItem));
    notifyListeners();
  }
  // increment(id){
  //   cartListSink.add(provider.incrementQuantity(id));
  //   bloc.inCartTotal.add(provider.addTotal());
  //   notifyListeners();
  // }
  // decrement(id){
  //   cartListSink.add(provider.decrementQuantity(id));
  //   bloc.inCartTotal.add(provider.addTotal());
  //   notifyListeners();
  // }

  void addTotal() {
    logger.i('Cart total from provider' + cartTotal.toString());
    notifyListeners();
  }

  void removeAll() {
    cartListSink.add(provider.removeAll());
    notifyListeners();
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
