import 'package:flutter/material.dart';
import 'package:taki/pages/HomePage.dart';
import 'package:taki/pages/ProductPage.dart';
import 'package:taki/pages/CartPage.dart';
import 'package:taki/pages/LoginPage.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Atasay"),
            accountEmail: Text("atasay@gmail.com"),
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
            leading: Icon(Icons.favorite_border),
            title: Text('Favoriler'),
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
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Sipariş Durumu'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts_outlined),
            title: Text('İletişim'),
          )
        ],
      ),
    );
  }
}