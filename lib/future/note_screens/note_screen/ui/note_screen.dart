import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do/future/custom_painter/app_custom_painter.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/add_note_text_field.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/draggable_widget.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/note_nav_bar.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteBloc(
          drawNoteNotifier: DrawNoteNotifier(),
          addNoteTextFieldNotifier: AddNoteTextFieldNotifier()),
      child: const _NoteScreen(),
    );
  }
}

class _NoteScreen extends StatefulWidget {
  const _NoteScreen();

  @override
  State<_NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<_NoteScreen> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Add Note'),
        actions: [TextButton(onPressed: () {}, child: const Text('OK'))],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NoteNavBar(),
      body: BlocBuilder<AddNoteBloc, AddNoteState>(
        builder: (context, state) {
          final blocValue = context.read<AddNoteBloc>();
          return GestureDetector(
              onPanUpdate: (details) => (state is AddNoteDrawLinesState)
                  ? blocValue.drawNoteNotifier.onPanUpdate(details,
                      currentScrollOffset: scrollController.offset)
                  : null,
              onPanEnd: (details) {
                if (state is AddNoteDrawLinesState) {
                  blocValue.drawNoteNotifier.finishLine();
                }
              },
              onTapUp: (details) => (state is! AddNoteDrawLinesState)
                  ? blocValue.addNoteTextFieldNotifier.onTapUp(details,
                      currentScrollOffset: scrollController.offset)
                  : null,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: state is AddNoteDrawLinesState
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                      maxHeight: double.maxFinite),
                  child: StreamBuilder<List<Offset>>(
                    stream: blocValue.addNoteTextFieldNotifier.positionsStream,
                    builder: (context, snapshot) => Stack(
                      children: [
                        Container(
                          color: Colors.white, // Фон экрана
                        ),
                        StreamBuilder<List<List<Offset>>>(
                            stream: context
                                .read<AddNoteBloc>()
                                .drawNoteNotifier
                                .positionsStreamController
                                .stream,
                            builder: (context, snapshot) {
                              return CustomPaint(
                                painter: AppCustomPainter(
                                    snapshot.data ?? []), // Для рисования
                                size: Size.infinite,
                              );
                            }),
                        ...(snapshot.data ?? []).asMap().entries.map((entry) {
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
                                    final renderBox = context.findRenderObject()
                                        as RenderBox?;
                                    if (renderBox == null) {
                                      return;
                                    }
                                    final localOffset =
                                        renderBox.globalToLocal(details.offset);
                                    blocValue.addNoteTextFieldNotifier
                                        .updateTextPosition(localOffset,
                                            updatedId: index,
                                            currentScrollOffset:
                                                scrollController.offset);
                                  },
                                  child: AddNoteTextField(
                                    controller: blocValue
                                        .addNoteTextFieldNotifier
                                        .controllers[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
