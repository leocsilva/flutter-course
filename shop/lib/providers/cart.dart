import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;

  CartItem({
    @required this.id,
    @required this.product,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((item) {
      total += item.product.price * item.quantity;
    });

    return total;
  }

  void removeItem(String cardItemId) {
    _items.removeWhere((item) => item.id == cardItemId);
    notifyListeners();
  }

  CartItem addItem(Product product) {
    CartItem item = _items.firstWhere((item) => item.product.id == product.id, orElse: () => null );
    if (item != null) {
      item.quantity += 1;
    } else {
      item = CartItem(id: DateTime.now().toString(), product: product, quantity: 1);
      _items.add(item);
    }
    notifyListeners();
    return item;
  }

  void removeSingleItem(String cartItemId) {
    CartItem item = _items.firstWhere((item) => item.id == cartItemId, orElse: () => null);

    if (item != null) {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        _items.removeWhere((item) => item.id == cartItemId);
      }
      notifyListeners();
    }
    
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}