import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/models/FireStoreOrder.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/pages/ContactPage.dart';
import 'package:taki/pages/HomePage.dart';
import 'package:taki/pages/OrderPage.dart';
import 'package:taki/pages/ProductPage.dart';
import 'package:taki/pages/CartPage.dart';
import 'package:taki/pages/LoginPage.dart';

class Sidebar extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(auth.currentUser!.email ?? "Anonym"),
            decoration: BoxDecoration(
              color: Color.fromRGBO(148, 137, 121, 1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.playlist_add_circle_outlined),
            title: Text('Ürünler'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text('Sepetim'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.library_add_outlined),
            title: Text('Siparişler'),
            onTap: () {
              var order = context.read<Shop>().order;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage(products: order)),
              );
            },
          ),
          /*Divider(),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Sipariş Durumu'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderStatus()),
              );
            },
          ),*/
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts_outlined),
            title: Text('İletişim'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red,),
            title: Text('Çıkış Yap', style: TextStyle(color: Colors.red),),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}