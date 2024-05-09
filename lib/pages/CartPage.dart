import 'package:flutter/material.dart';
import 'package:taki/models/products.dart';
import 'package:taki/components/my_product_title.dart';
import 'package:taki/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:taki/components/side_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Ürünü sepetten silicek misiniz ?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Kullanıcılar ödeme yapmak istiyor!"),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text("Sepetim"),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index){
                final item = cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
            },),
          ),
          /*MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("Satın Al"),
          ),*/
        ],
      ),
    );
  }
}
