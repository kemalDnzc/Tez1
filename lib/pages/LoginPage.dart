import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'package:taki/AdminPages/AdminLoginPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true; // Initial password visibility state

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('Giriş Yapıldı: ${userCredential.user!.email}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print('Hata : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lock,
            size: 80,
            color: Colors.white,
          ),
          Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(context),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 60),
        _buildGreyText("Kullanıcı Adı"),
        _buildInputField(_emailController, isPassword: false, prefixIcon: Icons.person, prefixIconColor: Color.fromRGBO(225, 175, 209, 10)),
        const SizedBox(height: 40),
        _buildGreyText("Şifre"),
        _buildInputField(_passwordController, isPassword: true, prefixIcon: Icons.lock, prefixIconColor: Color.fromRGBO(225, 175, 209, 10)),
        const SizedBox(height: 20),
        _buildLoginButton(context),
        const SizedBox(height: 20),
        _buildAdminLoginPage(context),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromRGBO(225, 175, 209, 10)),
    );
  }

  Widget _buildInputField(TextEditingController controller, {required bool isPassword, IconData? prefixIcon, Color? prefixIconColor}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: prefixIconColor) : null,
        suffixIcon: isPassword ? IconButton( // Şifre alanı için görünürlük ikonu gösterme
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ) : null, // Şifre alanı değilse suffixIcon null olacak
      ),
      obscureText: isPassword ? _isObscured : false, // Şifre alanı ise gizli yap, değilse gizleme
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _signInWithEmailAndPassword(context),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Color.fromRGBO(148, 137, 121, 1),
        backgroundColor: Color.fromRGBO(148, 137, 121, 1),
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("Giriş Yap", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildAdminLoginPage(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminLoginPage()),
          );
        },
        child: const Text(
          "Admin olarak giriş yap",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
