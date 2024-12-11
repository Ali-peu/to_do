
import 'package:flutter/material.dart';
import 'package:to_do/domain/model/note.dart';

class StarNotePages extends StatefulWidget {
  const StarNotePages({super.key});

  @override
  State<StarNotePages> createState() => _StarNotePagesState();
}

class _StarNotePagesState extends State<StarNotePages> {

  List<NoteModel> starMotes = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> content;
    if (starMotes.isEmpty) {
      content = [const Center(child: Text('Нету задач'))];
    } else {
      content = starMotes.map<Widget>((element) {
        return ListTile(
          leading: Text(element.description),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
            ),
            onPressed: () {
              // unawaited(HiveDataBase().starNote(element, element.isThisStar));
            },
          ),
        );
      }).toList();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Звездные задачи',
        ),
      ),
      body: ListView(children: content),
    );
  }
}
