import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text("Atasay"),
            accountEmail: Text("atasay@gmail.com"),
            decoration: BoxDecoration(
              color: Color.fromRGBO(148, 137, 121, 1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.playlist_add_circle_outlined),
            title: Text('Ürünler'),
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