import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taki/models/products.dart';
import 'package:taki/models/comment.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveOrder(List<Product> products) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final orderData = products.map((product) => {
        'name': product.name,
        'color': product.color,
        'size': product.size,
        'quantity': product.quantity,
        'imagePath': product.imagePath,
        'grammage': product.grammage,
        'description': product.description,
      }).toList();

      await _db.collection('orders').add({
        'userEmail': user.email,
        'products': orderData,
      });
    }
  }

  Future<List<Product>> fetchOrders() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await _db.collection('orders').where('userEmail', isEqualTo: user.email).get();
      List<Product> products = [];
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final productList = data['products'] as List;
        for (var productData in productList) {
          products.add(Product(
            name: productData['name'],
            color: productData['color'],
            size: productData['size'],
            quantity: productData['quantity'],
            imagePath: productData['imagePath'],
            grammage: productData['grammage'],
            description: productData['description'],
            userEmail: user.email!,
          ));
        }
      }
      return products;
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllOrders() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email == 'admin@gmail.com') {
      final snapshot = await _db.collection('orders').get(); // Tüm siparişleri al
      List<Map<String, dynamic>> orders = [];
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final productList = data['products'] as List;
        final userEmail = data['userEmail'] as String;
        for (var productData in productList) {
          orders.add({
            'product': Product(
              name: productData['name'],
              color: productData['color'],
              size: productData['size'],
              quantity: productData['quantity'],
              imagePath: productData['imagePath'],
              grammage: productData['grammage'],
              description: productData['description'],
              userEmail: userEmail,
            ),
            'userEmail': userEmail,
          });
        }
      }
      return orders;
    } else {
      // Admin kullanıcısı değilse boş liste döndür
      return [];
    }
  }

  Future<void> saveComment(String comment) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final newComment = Comment(
        comment: comment,
        timestamp: DateTime.now(),
        userEmail: user.email!,
      );
      await _db.collection('comments').add(newComment.toMap());
    }
  }

  Future<List<Comment>> fetchComments() async {
    final snapshot = await _db.collection('comments').orderBy('timestamp').get();
    return snapshot.docs.map((doc) => Comment.fromMap(doc.data())).toList();
  }
}