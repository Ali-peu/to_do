import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/data/firestore.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

// MediaQuery.of(context).size.height * .60,
class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('asf'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'It\'s your account page ${user.email}!',
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseDatasource().logOut();
                },
                child: Text("Log Out"),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    backgroundColor: Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}
