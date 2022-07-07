import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:logger/logger.dart';

class CartProvider {
  List<CartModel> cartitems = [];

  List<CartModel> addToList(CartModel cartItem) {
    bool isPresent = false;
    int index = -1;

    if (cartitems.isNotEmpty) {
      for (int i = 0; i < cartitems.length; i++) {
        logger.i(
            cartItem.id.toString().trim() == cartitems[i].id.toString().trim());
        if (cartItem.id.toString().trim() ==
            cartitems[i].id.toString().trim()) {
          isPresent = true;
          index = i;
        }
      }
      if (!isPresent) {
        logger.i("Item not present");
        cartitems.add(cartItem);
      } else {
        logger.i("Item is present");
        cartitems[index] = cartItem;
      }
    } else {
      cartitems.add(cartItem);
    }
    return cartitems;
  }

  List<CartModel> removeFromList(CartModel cartItem) {
    logger.i("remove cartItem with id: ${cartItem.id}");
    cartitems.removeWhere((element) => element.id == cartItem.id);
    return cartitems;
  }

  List<CartModel> getCartList() {
    return cartitems;
  }

  void removeItem(id) {
    logger.i('remove id' + id.toString());
    var tempProducts = [...cartitems];
    var tempCart = [];
    var removedProduct;
    for (int i = 0; i < tempProducts.length; i++) {
      if (tempProducts[i].id == id) {
        removedProduct = tempProducts[i];
        break;
      }
    }
    if (removedProduct != null) {
      removedProduct.inCart = false;
      removedProduct.quantity = 0;
      removedProduct.total = 0.0;
      cartitems = [...tempProducts];
    } else {
      cartitems = [...tempProducts];
    }

    if (cartitems.isNotEmpty) {
      for (int i = 0; i < cartitems.length; i++) {
        if (cartitems[i].id != id) {
          tempCart.add(cartitems[i]);
        }
      }
      cartitems = [...tempCart];
    }
    addTotal();
  }

  double addTotal() {
    var total = 0.0;
    if (cartitems.isNotEmpty) {
      for (int i = 0; i < cartitems.length; i++) {
        total =
            total + cartitems[i].product?.price + cartitems[i].fabric?.price;
      }
    }
    return total;
  }

  List<CartModel> removeAll() {
    cartitems.clear();
    addTotal();
    return cartitems;
  }
}
