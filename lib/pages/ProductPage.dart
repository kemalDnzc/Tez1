import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/components/my_product_title.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/models/products.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:taki/components/end_side_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Shop sınıfının bir örneğini al
    var shop = Provider.of<Shop>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        elevation: 0,
        title: Text("Ürünler", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        /*actions: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          )
        ],*/
      ),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 10),
      drawer: Sidebar(),
      endDrawer: EndSide(),
      body: FutureBuilder(
        future: shop.fetchProducts(),
        builder: (context, snapshot) {
          /*if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else*/ if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            return Consumer<Shop>(
              builder: (context, shop, child) {
                if (shop.shop.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: [
                    const SizedBox(height: 25),
                    Center(
                      child: Text(
                        "Seçim için mevcut ürünler listesi",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550,
                      child: ListView.builder(
                        itemCount: shop.shop.length,
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product = shop.shop[index];
                          return MyProductTitle(
                            product: product,
                            size: product.size,
                            color: product.color,
                            quantity: product.quantity,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
