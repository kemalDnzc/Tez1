import 'package:flutter/material.dart';
import 'package:taki/models/products.dart';

class myCard extends StatefulWidget {
  final Product product;

  myCard({Key? key, required this.product}) : super(key: key);

  @override
  _myCardState createState() => _myCardState();
}

class _myCardState extends State<myCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        width: 375,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                widget.product.imagePath,
                fit: BoxFit.cover, // Adjust this property to control how the image fits
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    widget.product.grammage.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
