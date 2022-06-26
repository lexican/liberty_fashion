import '../../models/models.dart';
import '../../utils/utils.dart';

class WishListProvider {
  List<CartModel> wishListitems = [];

  List<CartModel> addToList(CartModel cartItem) {
    wishListitems.add(cartItem);
    return wishListitems;
  }

  List<CartModel> removeFromList(CartModel cartItem) {
    wishListitems.removeWhere((element) => element.id == cartItem.id);
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
