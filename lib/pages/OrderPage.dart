import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/FireStoreOrder.dart';

class OrderPage extends StatelessWidget {
  final List<Product>? products;
  const OrderPage({super.key, this.products});

  @override
  Widget build(BuildContext context) {
    final orderProducts = products ?? [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 52, 72, 1),
        elevation: 0,
        title: const Text("Siparişler", style: TextStyle(color: Colors.white)),
      ),
      drawer: Sidebar(),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      body: FutureBuilder<List<Product>>(
        future: FirestoreService().fetchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Sipariş bulunamadı.'));
          } else {
            final orderProducts = snapshot.data!;
            return ListView.builder(
              itemCount: orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Renk: ${product.color}'),
                          Text('Ayar: ${product.size}'),
                          Text('Adet: ${product.quantity}'),
                        ],
                      ),
                      leading: Image.asset(product.imagePath),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}