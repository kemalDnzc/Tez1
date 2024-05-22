/*import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadDataToFirebase() async {
  List<Map<String, dynamic>> products = [
    {
      "name": "Aslan Sembolü",
      "price": 99.99,
      "description": "İtem description",
      "imagePath": "resimler/hyvnmodel0.png",
      "color": "white",
      "size": "8",
      "quantity": 0
    },
    {
      "name": "Çift Başlı Kartal Sembolü",
      "price": 100.99,
      "description": "İtem description 1",
      "imagePath": "resimler/hyvnmodel1.png",
      "color": "white",
      "size": "8",
      "quantity": 0
    },
    {
      "name": "Uçan Kartal Sembolü",
      "price": 45.99,
      "description": "İtem description 2",
      "imagePath": "resimler/hyvnmodel2.png",
      "color": "white",
      "size": "8",
      "quantity": 0
    },
    {
      "name": "Silah Motifi",
      "price": 31.99,
      "description": "İtem description 3",
      "imagePath": "resimler/slhmodel.png",
      "color": "white",
      "size": "8",
      "quantity": 0
    }
  ];

  for (var product in products) {
    await FirebaseFirestore.instance.collection('products').add(product);
  }
}*/
