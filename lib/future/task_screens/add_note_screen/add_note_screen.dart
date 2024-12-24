import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/future/custom_painter/app_custom_painter.dart';
import 'package:to_do/future/task_screens/add_note_screen/add_note_screen_model_view.dart';
import 'package:to_do/future/task_screens/add_note_screen/widgets/add_note_text_field.dart';
import 'package:to_do/future/task_screens/add_note_screen/widgets/draggable_widget.dart';
import 'package:to_do/future/task_screens/add_note_screen/widgets/note_nav_bar.dart';

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
          actions: [TextButton(onPressed: () {}, child: const Text('OK'))],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const NoteNavBar(),
        body: GestureDetector(
            onPanUpdate: (details) {
              if (value.isChoisePencil) {
// Добавляем точку при движении пальца
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset localPosition =
                    box.globalToLocal(details.globalPosition);

                value.addPoint(localPosition);
              }
            },
            onPanEnd: (details) {
              if (value.isChoisePencil) {
                value.finishLine();
              }
            },
            onTapUp: value.onTapUp,
            child: SingleChildScrollView(
              controller: value.scrollController,
              physics: value.isChoisePencil
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    maxHeight: double.maxFinite),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white, // Фон экрана
                    ),
                    CustomPaint(
                      painter: AppCustomPainter(value.points), // Для рисования
                      size: Size.infinite,
                    ),
                    ...value.positions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final position = entry.value;
                      final screenWidth = MediaQuery.of(context).size.width;
                      return Positioned(
                        left: position.dx,
                        top: position.dy,
                        child: SizedBox(
                          width: screenWidth - position.dx,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: DraggableWidget(
                              boxConstraints: BoxConstraints(
                                maxWidth: screenWidth - position.dx,
                              ),
                              onDragEnd: (details) {
                                final renderBox =
                                    context.findRenderObject() as RenderBox?;
                                if (renderBox == null) {
                                  return;
                                }
                                final localOffset =
                                    renderBox.globalToLocal(details.offset);
                                value.updateTextPosition(localOffset,
                                    updatedId: index);
                              },
                              child: AddNoteTextField(
                                controller: value.controllers[index],
                              ),
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
