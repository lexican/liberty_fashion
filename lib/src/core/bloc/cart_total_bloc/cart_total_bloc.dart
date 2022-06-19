import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:liberty_fashion/src/core/bloc/cart_bloc/cart_provider.dart';
import 'package:rxdart/rxdart.dart';

class CartTotalBloc extends BlocBase {

  CartTotalBloc();
  CartProvider provider = CartProvider();
//Stream that receives a number and changes the count;
  final _cartTotalBlocController = BehaviorSubject<double>.seeded(0.0);
//output
  Stream<double> get outCartTotal => _cartTotalBlocController.stream;
//input
  Sink<double> get inCartTotal => _cartTotalBlocController.sink;

  void onTotalChange(){
    inCartTotal.add(provider.addTotal());
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _cartTotalBlocController.close();
    super.dispose();
  }

}
