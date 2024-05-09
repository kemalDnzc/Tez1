import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider paketini ekleyin
import 'package:taki/components/my_product_title.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/components/side_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // inversePrimary yerine onPrimary kullanın
        title: Text("Ürünler"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      drawer: Sidebar(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Seçim için mevcut ürünler listesi",
              style: TextStyle(
                color:  Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTitle(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
