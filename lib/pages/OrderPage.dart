import 'package:flutter/material.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  final List<Product>? products;
  const OrderPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    //var cart = Provider.of<Shop>(context).cart;
    final orderProducts = products ?? [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        elevation: 0,
        title: Text("Siparişler", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      body: ListView.builder(
        itemCount: orderProducts.length,
        itemBuilder: (context, index){
          final product = orderProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Renk: ${product.color}'),
                Text('Ayar: ${product.size}'),
                Text('Adet: ${product.quantity}'),
              ],
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.imagePath),
              radius: 30,
            ),
          );
        },
      ),
    );
  }
}
