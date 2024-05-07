import 'package:flutter/material.dart';
import 'package:taki/models/cart.dart';
import 'package:taki/components/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    List<String> imageList = [
      "assets/resimler/hyvnmodel0.png",
      "assets/resimler/hyvnmodel1.png",
      "assets/resimler/hyvnmodel2.png",
      "assets/resimler/slhmodel.png"
    ];

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Vitrin',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(21, 52, 72, 1),
      ),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.10),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(.9),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search Code',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: size.height * .4,
              child: ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return myCard(imgAddress: imageList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}