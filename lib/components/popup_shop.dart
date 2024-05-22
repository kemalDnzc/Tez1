import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Popup extends StatefulWidget {
  final Product product;
  final String size;
  final String color;
  final int quantity;

  Popup({
    Key? key,
    required this.product,
    required this.size,
    required this.color,
    required this.quantity,
  }) : super(key: key);

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  /*String selectedSize;
  String selectedColor;
  int selectedQuantity;*/

  Future<void> addToCart(BuildContext context) async{
    String size = widget.size;
    String color = widget.color;
    int quantity = widget.quantity;

    //await _updateSelectedValues(context);

    /*@override
    void initState() {
      super.initState();
      size = widget.size.isNotEmpty ? widget.size : "Default Size";
      color = widget.color.isNotEmpty ? widget.color : "Default Color";
      quantity = widget.quantity > 0 ? widget.quantity : 1;
    }*/

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(223, 208, 184, 5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Adet',
                      labelStyle: TextStyle(color: Colors.lightBlue),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        quantity = int.tryParse(value) ?? 1;
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  DropdownButton<String>(
                    value: size,
                    onChanged: (String? newValue) {
                      setState(() {
                        size = newValue ?? "";
                      });
                    },
                    items: <String>['8', '9', '10', '14', '18', '21', '22']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          'Ayar: $value',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 50),
                  DropdownButton<String>(
                    value: color,
                    onChanged: (String? newValue) {
                      setState(() {
                        color = newValue ?? "";
                      });
                    },
                    items: <String>['rose', 'white', 'yellow']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          'Color: $value',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      if (quantity > 0 && size.isNotEmpty && color.isNotEmpty) {
                        Navigator.of(context).pop();
                        Product productToAdd = Product(
                          name: widget.product.name,
                          price: widget.product.price,
                          description: widget.product.description,
                          imagePath: widget.product.imagePath,
                          color: color!,
                          size: size!,
                          quantity: quantity!,
                        );
                        context.read<Shop>().addToCart(productToAdd);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Lütfen tüm bilgileri girin.')),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10)),
                    ),
                    child: Text('Sepete Ekle', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          addToCart(context);
        },
        child: Text('Sepete Ekle'),
      ),
    );
  }
}
