import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taki/AdminPages/AdminHomePage.dart';
import 'package:taki/models/shop.dart';
import 'package:taki/pages/ContactPage.dart';
import 'package:taki/pages/HomePage.dart';
import 'package:taki/pages/ProductPage.dart';
import 'pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AdminPages/AdminLoginPage.dart';
import 'firebase_options.dart';
import 'package:taki/components/pdfbar.dart';

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
        home: _getHomePage(), // Oluşturduğunuz sayfayı burada gösterin.
        routes: {
          '/admin-login': (context) => AdminLoginPage(),
        },
      ),
    );
  }

  Widget _getHomePage() {
    if (auth.currentUser == null) {
      return LoginPage();
    } else if (auth.currentUser!.email == 'admin@gmail.com') {
      return AdminHomePage();
    } else {
      return HomePage();
    }
  }
}