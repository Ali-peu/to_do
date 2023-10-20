import 'package:flutter/material.dart';
import 'package:to_do/data/auth_data.dart';
import 'package:to_do/data/google_auth.dart';
import 'package:to_do/global/app_colors.dart';
import 'package:to_do/widgets/universal_text_field.dart';

class AuthPage extends StatefulWidget {
  final VoidCallback show;
  const AuthPage(this.show, {super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: StyleApp().appColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 20),
            image(),
            const SizedBox(height: 20),
            universalTextFormField(
                email, _focusNodeEmail, 'Email', Icons.email, null),
            const SizedBox(height: 20),
            universalTextFormField(
                password, _focusNodePassword, 'Password', Icons.password, null),
            const SizedBox(height: 8),
            account(),
            const SizedBox(height: 20),
            loginButton(),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () => AuthServise().signInWithGoogle(),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Colors.green),
              child: const Text(
                'GoogLe Auth',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
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
          if (_formKey.currentState!.validate()) {
            AuthenticateRemote().login(email.text, password.text);
            setState(() {});
          }
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
