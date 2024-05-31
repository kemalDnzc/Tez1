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
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Popup(
              product: product,
              size: size,
              color: color,
              quantity: quantity,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        width: 300,
        child: SingleChildScrollView( // Column'ı kaydırılabilir hale getirdik.
          child: Column(
            mainAxisSize: MainAxisSize.min, // Column'un çocuklarına minimum yer kaplamasını söyledik.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  //color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath, fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: 25),
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              /*Text(
                product.description,
                style: TextStyle(
                  //color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),*/
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.grammage.toStringAsFixed(2), style: TextStyle(fontSize: 20),),
                  Container(
                    decoration: BoxDecoration(
                      //color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                              product: product,
                              size: size,
                              color: color,
                              quantity: quantity,
                            );
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
        ),
      ),
    );
  }
}
