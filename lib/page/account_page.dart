import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:to_do/data/firestore.dart';

import '../model/note.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

// MediaQuery.of(context).size.height * .60,
class _AccountPageState extends State<AccountPage> {
  void getBox() async {
    await Hive.openBox<Note>('box');
  }

  @override
  void initState() {
    super.initState();
    getBox();

    final box = Hive.box<Note>('box');
    box.watch().listen((event) {
      getBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'LOGIN PAGE',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'It\'s your account page!',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseDatasource().logOut();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    backgroundColor: Colors.amber),
                child: const Text("Log Out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
