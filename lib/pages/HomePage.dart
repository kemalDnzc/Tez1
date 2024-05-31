import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taki/models/cart.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/models/products.dart';
import 'package:taki/components/pdfbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = Product.ProductList;

  Future<String> _loadPDF() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/sangold1.pdf');
    final data = await rootBundle.load('assets/fileread/sangold1.pdf');
    final bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProducts);
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = Product.ProductList
          .where((product) =>
          product.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Ürün Ara...',
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
              height: size.height * .6,
              child: ListView.builder(
                itemCount: _filteredProducts.length,
                //itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return myCard(product: _filteredProducts[index]);
                },
              ),
            ),
            // PDF Görüntüleyiciye yönlendiren buton
            const SizedBox(height: 50), // Butonu aşağı indirmek için boşluk
            Center(
              child: SizedBox(
                width: size.width * 0.8, // Butonun genişliği
                height: 60, // Butonun yüksekliği
                child: ElevatedButton(
                  onPressed: () async {
                    String path = await _loadPDF();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFScreen(path: path),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(148, 137, 121, 1), // Butonun arka plan rengi
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Butonun kenarları
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.picture_as_pdf, size: 24), // İkon eklemek için
                      const SizedBox(width: 8), // İkon ve metin arasına boşluk
                      Text(
                        'Katalogu Aç',
                        style: TextStyle(
                          fontSize: 16, // Metin boyutu
                          fontWeight: FontWeight.bold, // Metin kalınlığı
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}