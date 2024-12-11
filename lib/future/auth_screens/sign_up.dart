// import 'package:flutter/material.dart';
// import 'package:to_do/data/auth_data.dart';
// import 'package:to_do/widgets/universal_text_field.dart';

// class SignUp extends StatefulWidget {
//   final VoidCallback show;
//   const SignUp(this.show, {super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormState>();
//   final FocusNode _focusNodeEmail = FocusNode();
//   final FocusNode _focusNodePassword = FocusNode();
//   final FocusNode _focusNodePasswordConfirm = FocusNode();

//   final email = TextEditingController();
//   final password = TextEditingController();
//   final passwordConfirm = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _focusNodeEmail.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//     _focusNodePassword.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//     _focusNodePasswordConfirm.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext build) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             const SizedBox(height: 20),
//             image(),
//             const SizedBox(height: 20),
//             universalTextFormField(
//                 email, _focusNodeEmail, 'Email', Icons.email, null),
//             const SizedBox(height: 20),
//             universalTextFormField(
//                 password, _focusNodePassword, 'Password', Icons.password, null),
//             const SizedBox(height: 20),
//             universalTextFormField(passwordConfirm, _focusNodePasswordConfirm,
//                 'Please repeat the password', Icons.password, password),
//             const SizedBox(height: 8),
//             account(),
//             const SizedBox(height: 20),
//             signButton()
//           ]),
//         ),
//       )),
//     );
//   }

//   Widget account() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Do you have account?',
//             style: TextStyle(color: Colors.grey[700], fontSize: 14),
//           ),
//           const SizedBox(width: 5),
//           GestureDetector(
//             onTap: widget.show,
//             child: const Text(
//               'Login',
//               style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget signButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           AuthenticateRemote()
//               .register(email.text, password.text, passwordConfirm.text);
//         }
//       },
//       style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           backgroundColor: Colors.green),
//       child: const Text(
//         'Sign UP',
//         style: TextStyle(
//             color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget image() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         width: double.infinity,
//         height: 300,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('images/first.png'), fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }
