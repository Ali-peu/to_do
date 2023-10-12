import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/data/auth_data.dart';
import 'package:to_do/global/validador_text.dart';

class AuthPage extends StatefulWidget {
  final VoidCallback show;
  AuthPage(this.show, {super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {});
    });
    super.initState();
    _focusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          child: Column(children: [
            const SizedBox(height: 20),
            image(),
            const SizedBox(height: 20),
            textFormField(email, _focusNodeEmail, 'Email', Icons.email),
            const SizedBox(height: 20),
            textFormField(
                password, _focusNodePassword, 'Password', Icons.password),
            const SizedBox(height: 8),
            account(),
            const SizedBox(
              height: 20,
            ),
            loginButton()
          ]),
        ),
      )),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have account?',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
        onPressed: () async {
          AuthenticateRemote().login(email.text, password.text);
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.green),
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ));
  }

  Widget textFormField(TextEditingController _controller, FocusNode _focusNode,
      String typeName, IconData iconData) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        prefixIcon: Icon(
          Icons.email,
          color: _focusNode.hasFocus
              ? Color.fromRGBO(112, 243, 114, 1)
              : Color(0xffc5c5c5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: typeName,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffc5c5c5), width: 2.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromRGBO(112, 243, 114, 1), width: 2.0)),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/first.png'), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
