import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taki/models/products.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
     /*Product(
        name: "K1001",
        price: 99.99,
        description: "İtem description",
        imagePath: 'resimler/hyvnmodel0.png',
        color: "white",
        size: "8",
        quantity: 0,
      ),

        Product(
          name: "K1002",
          price: 100.99,
          description: "İtem description 1",
          imagePath: 'resimler/hyvnmodel1.png',
          color: "white",
          size: "8",
          quantity: 0,
        ),

        Product(
          name: "K1003",
          price: 45.99,
          description: "İtem description 2",
          imagePath: 'resimler/hyvnmodel2.png',
          color: "white",
          size: "8",
          quantity: 0,
        ),

        Product(
          name: "K1004",
          price: 31.99,
          description: "İtem description 3",
          imagePath: 'resimler/slhmodel.png',
          color: "white",
          size: "8",
          quantity: 0,
        ),

    Product(
      name: "K1005",
      price: 31.99,
      description: "İtem description 4",
      imagePath: 'resimler/hcmodel.png',
      color: "white",
      size: "8",
      quantity: 0,
    ),

    Product(
      name: "K1006",
      price: 31.99,
      description: "İtem description 5",
      imagePath: 'resimler/slhmodel2.png',
      color: "white",
      size: "8",
      quantity: 0,
    ),

    Product(
      name: "K1007",
      price: 31.99,
      description: "İtem description 6",
      imagePath: 'resimler/dnzmodel.png',
      color: "white",
      size: "8",
      quantity: 0,
    ),*/
  ];
 /* Future<Map<String, dynamic>> getDefaultValues() async {
    // Varsayılan değerleri almak için bir asenkron işlem simülasyonu yapın
    await Future.delayed(Duration(seconds: 1));
    return {
      'defaultSize': "9",
      'defaultColor': "yellow",
      'defaultQuantity': 5,
    };
  }*/

  List<Product> _cart = [];
  List<Product> _order = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  List<Product> get order => _order;
  bool _productsFetched = false;

  Shop() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    if (_productsFetched) return;
    try {
      DatabaseReference ref = FirebaseDatabase.instance.reference().child('products');
      DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);
      Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;
      if (values != null) {
        List<Product> loadedProducts = values.entries.map((entry) {
          Map<dynamic, dynamic> item = entry.value;
          return Product(
            name: item['name'] ?? 'No name',
            grammage: item['grammage'] ?? 0.0,
            description: item['description'] ?? 'No description',
            imagePath: item['imagePath'] ?? 'No image',
            color: item['color'] ?? 'No color',
            size: item['size'] ?? 'No size',
            quantity: item['quantity'] ?? 0,
            userEmail: item['userEmail'] ?? 'No Email',
          );
        }).toList();

        _shop.clear();
        _shop.addAll(loadedProducts);
        //print("Yüklü Ürünler: $loadedProducts");
        _productsFetched = true;
        notifyListeners();
      } else {
        print("Veri yok veya boş.");
      }
    } catch (e) {
      print("Bir hata oldu çekmede: $e");
    }
    //return loadedProducts;
  }


  /*Future<List<Product>> fetchProducts() async {
    List<Product> loadedProducts = [];
    try {
      DatabaseReference ref = FirebaseDatabase(databaseURL: "https://takiuygulamasi-default-rtdb.europe-west1.firebasedatabase.app",).reference().child('products');
      DataSnapshot snapshot = await ref.once().then((event) => event.snapshot);

      if (snapshot.exists && snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

        values.forEach((key, item) {
          _shop.add(Product(
            name: item['name'] ?? 'No name',
            price: item['price'] ?? 0.0,
            description: item['description'] ?? 'No description',
            imagePath: item['imagePath'] ?? 'No image',
            color: item['color'] ?? 'No color',
            size: item['size'] ?? 'No size',
            quantity: item['quantity'] ?? 0,
          ));
        });

        _shop.clear();
        _shop.addAll(loadedProducts);
        print("Yüklü Ürünler: $loadedProducts");
        notifyListeners();
      }
      else {
        print("Veri yok veya boş.");
      }
    } catch (e) {
      print("Bir hata oldu çekmede: $e");
    }
    //return _shop;
    return loadedProducts;
  }*/


  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void addToOrder(Product item) {
    _order.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return _shop;
    }
    return _shop.where((products) {
      return products.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
  /*void addToCartWithDefaultValues(Product item) {
    // Varsayılan değerler belirleniyor
    String defaultColor = "yellow";
    String defaultSize = "9";
    int defaultQuantity = 5;

    // Ürünün kopyası oluşturuluyor ve varsayılan değerler atanıyor
    Product productToAdd = Product(
      name: item.name,
      price: item.price,
      description: item.description,
      imagePath: item.imagePath,
      color: defaultColor,
      size: defaultSize,
      quantity: defaultQuantity,
    );

    // Sepete ekleniyor
    _cart.add(productToAdd);
    notifyListeners();
  }*/
}
