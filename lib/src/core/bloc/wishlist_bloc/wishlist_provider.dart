import '../../models/models.dart';
import '../../utils/utils.dart';

class WishListProvider {
  List<CartModel> wishListitems = [];

  List<CartModel> addToList(CartModel cartItem) {
    logger.i("price: ${cartItem.product}");
    logger.i("total: ${cartItem.product}");
    logger.i("quantity: ${cartItem.quantity}");
    logger.i("id: ${cartItem.id}");

    wishListitems.add(cartItem);
    return wishListitems;
  }

  List<CartModel> removeFromList(CartModel cartItem) {
    wishListitems.remove(cartItem);
    return wishListitems;
  }

  List<CartModel> getCartList() {
    return wishListitems;
  }

  List<CartModel> removeAll() {
    wishListitems.clear();
    return wishListitems;
  }
}
