import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taki/AdminComponents/admin_side_bar.dart';
import 'package:provider/provider.dart';
import 'package:taki/models/comment.dart';
import 'package:taki/models/FireStoreOrder.dart';

class AdminContactPage extends StatelessWidget {
  const AdminContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gelen Yorumlar', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        centerTitle: true,
      ),
      drawer: AdminSideBar(),
      body: FutureBuilder<List<Comment>>(
        future: FirestoreService().fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Henüz yorum yok'));
          } else {
            final comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length * 2 - 1,
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return Divider();
                }
                final commentIndex = index ~/ 2;
                final comment = comments[commentIndex];
                return ListTile(
                  title: Text(comment.comment),
                  subtitle: Text('Gönderen: ${comment.userEmail}\nTarih: ${comment.timestamp}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
