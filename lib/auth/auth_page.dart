import 'package:flutter/widgets.dart';
import 'package:to_do/page/login.dart';
import 'package:to_do/page/sign_up.dart';

class Auth_Page extends StatefulWidget {
  Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a = true;

  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return AuthPage(to);
    } else {
      return SignUp(to);
    }
  }
}
