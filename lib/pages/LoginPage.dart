import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    }catch (e) {
      print('Hata : $e');
    }

  }
  late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    //var ekranBilgisi = MediaQuery.of(context);
    //final double ekranYuksekligi = ekranBilgisi.size.height;
    //final double ekranGenisligi = ekranBilgisi.size.width;

    return Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
      width: mediaSize.width,
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
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(context),
        ),
      ),
    );
  }
  Widget _buildForm(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildGreyText("Please login with your information"),
        const SizedBox(height: 60),
        _buildGreyText("Kullanıcı Adı"),
        _buildInputField(_emailController, prefixIcon: Icons.person, prefixIconColor: Color.fromRGBO(225, 175, 209, 10)),
        const SizedBox(height: 40),
        _buildGreyText("Şifre"),
        _buildInputField(_passwordController, isPassword: true, prefixIcon: Icons.lock, prefixIconColor: Color.fromRGBO(225, 175, 209, 10)),
        const SizedBox(height: 20),
        _buildLoginButton(context),
      ],
    );
  }
  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(color: Color.fromRGBO(225, 175, 209, 10)),
    );
  }
  Widget _buildInputField(TextEditingController controller, {isPassword = false, IconData? prefixIcon, Color? prefixIconColor}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        //prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: prefixIconColor,) : null,
        suffixIcon: isPassword?Icon(Icons.remove_red_eye):Icon(Icons.person),
      ),
      obscureText: isPassword,
    );
  }
  Widget _buildLoginButton(BuildContext context){
    return ElevatedButton(
      onPressed: () => _signInWithEmailAndPassword(context),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("Giriş Yap"),
    );
  }
}