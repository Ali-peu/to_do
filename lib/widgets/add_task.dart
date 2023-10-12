import 'package:flutter/material.dart';

import 'package:to_do/data/firestore.dart';

class AddTaskPlus extends StatefulWidget {
  const AddTaskPlus({super.key});

  @override
  State<AddTaskPlus> createState() => _AddTaskPlusState();
}

class _AddTaskPlusState extends State<AddTaskPlus> {
  final subtitle = TextEditingController();

  final FocusNode _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(body: Center(
      child: MaterialButton(onPressed: () {
        _displayBottomSheet(context);
      }),
    ));
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 200,
              color: Colors.red,
            ));
  }

  Widget button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(170, 48),
      ),
      onPressed: () {
        FirebaseDatasource().AddNote(subtitle.text);
        Navigator.pop(context);
      },
      child: Text('Add task'),
    );
  }

  Padding subtiteWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 6,
          controller: subtitle,
          focusNode: _focusNode2,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'subtitle',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
