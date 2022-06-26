import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:liberty_fashion/src/core/bloc/cart_bloc/cart_provider.dart';
import 'package:liberty_fashion/src/core/bloc/cart_total_bloc/cart_total_bloc.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase {
  CartBloc();

  final _listController = BehaviorSubject<List<CartModel>>.seeded([]);

  CartProvider provider = CartProvider();
  final CartTotalBloc bloc = BlocProvider.getBloc<CartTotalBloc>();

//output
  Stream<List<CartModel>> get cartListStream => _listController.stream;
//input
  Sink<List<CartModel>> get cartListSink => _listController.sink;

  double cartTotal = 0.0;

  //Business Logic

  void addToList(CartModel item) {
    cartListSink.add(provider.addToList(item));
    //bloc.inCartTotal.add(provider.addTotal());
    //print('cart length: ' + provider.getCartList().length.toString());
    notifyListeners();
  }

  void removeFromList(CartModel item) {
    cartListSink.add(provider.removeFromList(item));
    //bloc.inCartTotal.add(provider.addTotal());
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
    bloc.inCartTotal.add(provider.addTotal());
    print('Cart total from provider' + cartTotal.toString());
    notifyListeners();
  }

  void removeAll() {
    cartListSink.add(provider.removeAll());
    bloc.inCartTotal.add(provider.addTotal());
    notifyListeners();
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
