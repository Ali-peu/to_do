import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/future/task_screens/add_note_screen/add_note_screen_model_view.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<AddNoteScreenModelView>(context, listen: false),
      child: const AddNoteScreenWithProvider(),
    );
  }
}

class AddNoteScreenWithProvider extends StatefulWidget {
  const AddNoteScreenWithProvider({super.key});

  @override
  State<AddNoteScreenWithProvider> createState() =>
      _AddNoteScreenWithProviderState();
}

class _AddNoteScreenWithProviderState extends State<AddNoteScreenWithProvider> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNoteScreenModelView>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Add Note'),
        ),
        body: GestureDetector(
          
            onTapUp: value.onTapUp,
            child: SingleChildScrollView(
              controller: value.scrollController,
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    maxHeight: double.maxFinite
                    ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white, // Фон экрана
                    ),
                    ...value.positions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final position = entry.value;
                      return Positioned(
                        left: position.dx,
                        top: position.dy,
                        child: SizedBox(
                          width: 200,
                          child: TextField(
                            controller: value.controllers[index],
                            expands: false,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter text',
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            )),
      );
    });
  }

  // @override
  // void dispose() {
  //   Provider.of<AddNoteScreenModelView>(context, listen: false).onCloseScreen();

  //   super.dispose();
  // }
}
