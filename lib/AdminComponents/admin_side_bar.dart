import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taki/AdminPages/AdminHomePage.dart';
import 'package:taki/AdminPages/AdminLoginPage.dart';
import 'package:taki/AdminPages/AdminContactPage.dart';
import 'package:taki/AdminPages/CustomerRegister.dart';

class AdminSideBar extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin Panel", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
            accountEmail: Text(auth.currentUser!.email ?? "Anonym"),
            decoration: BoxDecoration(
              color: Color.fromRGBO(148, 137, 121, 1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text('Gelen Siparişler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHomePage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts_outlined),
            title: Text('Gelen Yorumlar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminContactPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Kullanıcı Kayıt'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerRegister()),
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
                MaterialPageRoute(builder: (context) => AdminLoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
