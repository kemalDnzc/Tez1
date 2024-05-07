import 'package:flutter/cupertino.dart';
import 'package:taki/models/products.dart';

class Shop extends ChangeNotifier {

  final List<Product> _shop = [
      Product(
        name: "Product 1",
        price: 99.99,
        description: "İtem description",
        imagePath: 'resimler/taki1.jpeg',
      ),

        Product(
          name: "Product 2",
          price: 100.99,
          description: "İtem description 1",
          imagePath: 'resimler/taki2.jpeg',
        ),

        Product(
          name: "Product 3",
          price: 45.99,
          description: "İtem description 2",
          imagePath: 'resimler/taki3.jpeg',
        ),

        Product(
          name: "Product 4",
          price: 31.99,
          description: "İtem description 3",
          imagePath: 'resimler/taki4.jpeg',
        ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }


}