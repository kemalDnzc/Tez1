import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/pages/HomePage.dart';
import 'package:taki/pages/ProductPage.dart';
import 'pages/LoginPage.dart';// Oluşturduğunuz sayfayı dahil edin.
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/CartPage.dart';
import 'pages/ProductPage.dart';

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
        home: HomePage(), // Oluşturduğunuz sayfayı burada gösterin.
      ),
    );
  }
}