import 'package:flutter/material.dart';

import '../../../core/model/cart_model.dart';
import '../../../core/model/product_model.dart';


class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalAmount => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(Product product) {
    final existingIndex = _items.indexWhere((item) => item.productId == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex] = CartItem(
        id: _items[existingIndex].id,
        productId: product.id,
        name: product.name,
        quantity: _items[existingIndex].quantity + 1,
        price: product.price,
        imageUrl: product.imageUrl,
      );
    } else {
      _items.add(
        CartItem(
          id: DateTime.now().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
          imageUrl: product.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}