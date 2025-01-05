import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/drift_datebase_providers/note_linear_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';

import 'package:to_do/future/custom_painter/app_custom_painter.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/data/save_note_repo.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/add_note_text_field.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/draggable_widget.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/note_nav_bar.dart';

class NoteScreen extends StatelessWidget {
  final int? noteId;
  const NoteScreen({required this.noteId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteScreenBloc(
          saveNoteRepo: SaveNoteRepo(
              noteTextRepository:
                  Provider.of<NoteTextRepository>(context, listen: false),
              noteRepository:
                  Provider.of<NoteRepository>(context, listen: false),
              notePositionsRepository:
                  Provider.of<NotePositionsRepository>(context, listen: false),
              noteLinearRepository:
                  Provider.of<NoteLinearRepository>(context, listen: false)),
          drawNoteNotifier: DrawNoteNotifier(),
          addNoteTextFieldNotifier: AddNoteTextFieldNotifier(),
          noteId: noteId)
        ..add(FetchData(noteId: noteId)),
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
        actions: [
          TextButton(
              onPressed: () {
                if (context
                        .read<NoteScreenBloc>()
                        .addNoteTextFieldNotifier
                        .controllers
                        .isNotEmpty ||
                    context
                        .read<NoteScreenBloc>()
                        .drawNoteNotifier
                        .points
                        .isNotEmpty) {
                  context.read<NoteScreenBloc>().add(SaveNote());
                }
              },
              child: const Text('OK'))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NoteNavBar(),
      body: BlocBuilder<NoteScreenBloc, NoteScreenState>(
        builder: (context, state) {
          final blocValue = context.read<NoteScreenBloc>();
          return GestureDetector(
              onPanUpdate: (details) =>
                  (state.noteScreenStatus == NoteScreenStatus.drawing)
                      ? blocValue.drawNoteNotifier.onPanUpdate(details,
                          currentScrollOffset: scrollController.offset)
                      : null,
              onPanEnd: (details) {
                if (state.noteScreenStatus == NoteScreenStatus.drawing) {
                  blocValue.drawNoteNotifier.finishLine();
                }
              },
              onTapUp: (details) =>
                  (state.noteScreenStatus != NoteScreenStatus.drawing)
                      ? blocValue.addNoteTextFieldNotifier.onTapUp(details,
                          currentScrollOffset: scrollController.offset)
                      : null,
              child: SingleChildScrollView(
                controller: scrollController,
                physics: state.noteScreenStatus == NoteScreenStatus.drawing
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
                                .read<NoteScreenBloc>()
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
