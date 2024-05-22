import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/pages/ContactPage.dart';
import 'package:taki/pages/HomePage.dart';
import 'package:taki/pages/ProductPage.dart';
import 'pages/LoginPage.dart';// Oluşturduğunuz sayfayı dahil edin.
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'pages/CartPage.dart';
import 'pages/ProductPage.dart';
import 'pages/ContactPage.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shop()),
      ],
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        home: auth.currentUser == null ? LoginPage() : HomePage(), // Oluşturduğunuz sayfayı burada gösterin.
      ),
    );
  }
}