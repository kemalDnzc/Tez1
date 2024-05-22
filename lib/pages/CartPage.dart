import 'package:flutter/material.dart';
import 'package:taki/models/products.dart';
import 'package:taki/components/my_product_title.dart';
import 'package:taki/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/components/popup_shop.dart';
import 'package:taki/pages/OrderPage.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.grey,
        content: Text("Ürünü sepetten silmek istiyor musunuz?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("İptal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Evet"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context, List<Product> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Sepeti Onaylıyacak mısınız ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              for (var product in order){
                context.read<Shop>().addToOrder(product);
              }
            },
            child: const Text("Evet"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Hayır"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final cart = context.watch<Shop>().cart;
    var cart = Provider.of<Shop>(context).cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        elevation: 0,
        //foregroundColor: Colors.white,
        title: const Text("Sepetim", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];

          return FutureBuilder<void>(
            future: _updateSelectedValues(context, item),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Hata: ${snapshot.error}');
              } else {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: TextStyle(color: Colors.white)),
                      Text('Renk: ${item.color}', style: TextStyle(color: Colors.white)),
                      Text('Ayar: ${item.size}', style: TextStyle(color: Colors.white)),
                      Text('Adet: ${item.quantity}', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  //subtitle: Text(item.price.toStringAsFixed(2)),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(item.imagePath),
                    radius: 30,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => payButtonPressed(context, cart),
        child: const Icon(Icons.check),
      ),
    );
  }

  Future<void> _updateSelectedValues(BuildContext context, Product item) async {
    // Asenkron olarak seçilen değerleri güncelle
    // Örnek olarak:
    // await Future.delayed(Duration(seconds: 1));
    // item.color = 'Yeni Renk';
    // item.size = 'Yeni Boyut';
    // item.quantity = 10;
  }
}
