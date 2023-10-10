import 'package:flutter/material.dart';
import 'package:to_do/auth/auth_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/page/home.dart';

class Main_Page extends StatelessWidget {
  Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return Auth_Page();
          }
        },
      ),
    );
  }
}
