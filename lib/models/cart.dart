import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class UserCart extends ChangeNotifier {
  Map<Product, int> products_in_cart = {};
  int NumberOfItems() {
    int sum = 0;
    products_in_cart.forEach((key, value) {
      sum += value;
    });
    return sum;
  }

  double calculateTotal() {
    double sum = 0;
    products_in_cart.forEach((key, value) {
      sum += key.price * value;
    });
    return sum;
  }

  void addItem(Product product) {
    if (products_in_cart[product] == null) {
      products_in_cart[product] = 1;
    } else {
      products_in_cart[product] = products_in_cart[product]! + 1;
    }
    notifyListeners();
  }

  void deleteItem(Product product) {
    if (products_in_cart[product] == 1) {
      products_in_cart.remove(product);
    } else if (products_in_cart[product] != null) {
      products_in_cart[product] = products_in_cart[product]! - 1;
    }
    notifyListeners();
  }
}

UserCart cart = UserCart();
