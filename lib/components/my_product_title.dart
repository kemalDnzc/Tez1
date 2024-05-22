import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taki/components/popup_shop.dart';
import 'package:taki/models/products.dart';

class MyProductTitle extends StatelessWidget {
  final Product product;
  final String size;
  final String color;
  final int quantity;

  const MyProductTitle({
    Key? key,
    required this.product,
    required this.size,
    required this.color,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Card(
      child: Column(
        children: [
          Image.asset(product.imagePath),
          Text(product.name),
          Text(product.description),
          Text('Fiyat: ${product.price}'),
          Text('Renk: $color'),
          Text('Beden: $size'),
          Text('Miktar: $quantity'),
        ],
      ),
    );*/
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath), // Image.asset yerine Image.network
                ),
              ),
              const SizedBox(height: 25),
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(product: product, size: product.size, color: product.color, quantity: product.quantity);
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
