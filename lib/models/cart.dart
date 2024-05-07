import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  String imgAddress;
  myCard({super.key, required this.imgAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        width: 375,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite_border_outlined),
                  color: Colors.black,
                  iconSize: 30,
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              top: 50,
              bottom: 80,
              child: Image.asset(imgAddress),
            ),
            const Positioned(
              bottom: 15,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deneme",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Deneme2",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Deneme3",
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}