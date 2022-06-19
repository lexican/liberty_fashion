import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';

class CartProvider {
  List<CartModel> cartitems = [];

  List<CartModel> addToList(CartModel cartItem) {
    bool isPresent = false;
    int index = -1;

    // print("price: ${cartItem.price}");
    // print("total: ${cartItem.total}");
    // print("quantity: ${cartItem.quantity}");
    // print("id: ${cartItem.id}");

    //cartitems.add(cartItem);

    if (cartitems.isNotEmpty) {
      for (int i = 0; i < cartitems.length; i++) {
        // logger.i("new cartItem id: " + cartItem.id);
        // print("cartId: " + cartitems[i].id);
        logger
            .i(cartItem.id.toString().trim() == cartitems[i].id.toString().trim());
        if (cartItem.id.toString().trim() == cartitems[i].id.toString().trim()) {
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
    cartitems.remove(cartItem);
    return cartitems;
  }

  List<CartModel> getCartList() {
    return cartitems;
  }

  List<CartModel> incrementQuantity(id) {
    //TODO Implement later
    // var tempCart = [...cartitems];
    // CartModel? cartItemToIncrement;
    // if (tempCart.isNotEmpty) {
    //   for (int i = 0; i < tempCart.length; i++) {
    //     if (tempCart[i].id == id) {
    //       cartItemToIncrement = tempCart[i];
    //       break;
    //     }
    //   }
    //   if (cartItemToIncrement != null) {
    //     var index = tempCart.indexOf(cartItemToIncrement);
    //     var product = tempCart[index];
    //     product.quantity = product.quantity + 1;
    //     product.total = product.quantity * product.price;
    //     cartitems = [...tempCart];
    //   }
    // }
    // addTotal();
    return cartitems;
  }

  List<CartModel> decrementQuantity(id) {
    //TODO Implement later
    // var tempCart = [...cartitems];
    // CartModel? cartItemToIncrement;
    // if (tempCart.isNotEmpty) {
    //   for (int i = 0; i < tempCart.length; i++) {
    //     if (tempCart[i].id == id) {
    //       cartItemToIncrement = tempCart[i];
    //       break;
    //     }
    //   }
    //   if (cartItemToIncrement != null) {
    //     var index = tempCart.indexOf(cartItemToIncrement);
    //     var product = tempCart[index];
    //     product.quantity = product.quantity - 1;
    //     if (product.quantity == 0) {
    //       cartitems.remove(product);
    //       //removeItem(id);
    //     } else {
    //       product.total = product.quantity * product.price;
    //       cartitems = [...tempCart];
    //     }
    //   }
    // }
    // addTotal();
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
    logger.i('Total: ' + total.toString());
    return total;
  }

  List<CartModel> removeAll() {
    cartitems.clear();
    addTotal();
    return cartitems;
  }
}
