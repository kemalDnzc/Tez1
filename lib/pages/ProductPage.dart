import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/components/my_product_title.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/components/side_bar.dart';
import 'package:taki/models/products.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ValueNotifier<String> searchQuery = ValueNotifier<String>("");
  int? selectedFilter;

  void _onFilterSelected(int? filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    var shop = Provider.of<Shop>(context);
    //ValueNotifier<String> searchQuery = ValueNotifier<String>("");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        elevation: 0,
        title: Text("Ürünler", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      drawer: Sidebar(),
      body: FutureBuilder(
        future: shop.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else {
            return Consumer<Shop>(
              builder: (context, shop, child) {
                if (shop.shop.isEmpty) {
                  return Center(child: Text('Ürün bulunamadı.'));
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,
                            horizontal: 12),
                        child: Container(
                          height: 50,
                          child: ValueListenableBuilder<String>(
                            valueListenable: searchQuery,
                            builder: (context, value, child) {
                              return TextField(
                                onChanged: (value) {
                                  searchQuery.value = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Ürün Ara...',
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    height: 0,
                                  ),
                                  prefixIcon: Icon(Icons.search,
                                    color: Colors.black.withOpacity(0.9),),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: false,
                                  fillColor: Colors.white.withOpacity(.10),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: searchQuery,
                        builder: (context, value, child) {
                          List<Product> filteredProducts = shop.searchProducts(
                              value);
                          if (filteredProducts.isEmpty) {
                            return Center(child: Text('Ürün Bulunamadı.'));
                          }
                          return SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.72, // Adjust height as needed
                            child: ListView.builder(
                              //itemCount: shop.shop.length,
                              itemCount: filteredProducts.length,
                              padding: const EdgeInsets.all(15),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                //final product = shop.shop[index];
                                final product = filteredProducts[index];
                                return MyProductTitle(
                                  product: product,
                                  size: product.size,
                                  color: product.color,
                                  quantity: product.quantity,
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
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