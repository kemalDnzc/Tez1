import 'package:flutter/material.dart';
import 'package:taki/AdminPages/AdminLoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/FireStoreOrder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taki/AdminComponents/admin_side_bar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService = FirestoreService();
    final User? user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Gelen Siparişler', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        //automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      drawer: AdminSideBar(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: firestoreService.fetchAllOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Gösterilecek sipariş yok.'));
          } else {
            final orders = snapshot.data!;
            orders.sort((a, b) => a['userEmail'].compareTo(b['userEmail']));
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final product = order['product'] as Product;
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Image.asset(product.imagePath),
                        title: Text(product.name),
                        subtitle: Text(
                            'Renk: ${product.color}\nAyar: ${product.size}\nAdet: ${product.quantity}'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                        child: Text(
                          'Sipariş Veren Email: ${product.userEmail}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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
