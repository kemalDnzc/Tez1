import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    email = "asdasd@gmail.com";
    password = "kemal2";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _formKey,
      children: [
        // TextFormField(
        // onSaved: (newValue) => email = newValue!,
        // ),
        // TextFormField(
        // onSaved: (newValue) => password = newValue!,
        // ),
        ElevatedButton(
            onPressed: () async {
              // _formKey.currentState!.save();
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email, password: password);
            },
            child: Text("aa"))
      ],
    );
  }
}
