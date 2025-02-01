import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/drift_datebase_providers/note_linear_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_positions_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_repository.dart';
import 'package:to_do/data/drift_datebase_providers/note_text_repository.dart';
import 'package:to_do/future/draw_screen/bloc/draw_bloc.dart';

import 'package:to_do/future/draw_screen/draw_screen.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/data/save_note_repo.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/domain/draw_note_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/add_note_text_field.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/draggable_widget.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/note_nav_bar.dart';
import 'package:to_do/future/note_screens/notes_screen/notes_screen_model_view.dart';

class NoteScreen extends StatelessWidget {
  final int? noteId;
  const NoteScreen({required this.noteId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteScreenBloc(
          notesScreenModelView:
              Provider.of<NotesScreenModelView>(context, listen: false),
          drawNoteNotifier:
              Provider.of<DrawNoteNotifier>(context, listen: false),
          saveNoteRepo: SaveNoteRepo(
              noteTextRepository:
                  Provider.of<NoteTextRepository>(context, listen: false),
              noteRepository:
                  Provider.of<NoteRepository>(context, listen: false),
              notePositionsRepository:
                  Provider.of<NotePositionsRepository>(context, listen: false),
              noteLinearRepository:
                  Provider.of<NoteLinearRepository>(context, listen: false)),
          addNoteTextFieldNotifier:
              Provider.of<AddNoteTextFieldNotifier>(context, listen: false),
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
  void deactivate() {
    super.deactivate();
    context.read<DrawBloc>().add(const ClearDrawing());
    Provider.of<AddNoteTextFieldNotifier>(context, listen: false).clearData();
  }

  void onPanEnd(NoteScreenState state, BuildContext context) {
    Provider.of<DrawNoteNotifier>(context, listen: false).onPanEnd(
        state.noteScreenStatus,
        () => context.read<DrawBloc>().add(const OnPanEnd()));
  }

  void onPanStart(
      NoteScreenState state, BuildContext context, DragStartDetails details) {
    Provider.of<DrawNoteNotifier>(context, listen: false).onPanStart(
        noteScreenStatus: state.noteScreenStatus,
        blockFunction: (data) => context.read<DrawBloc>().add(OnPanStart(data)),
        pointPosition: Offset(details.localPosition.dx,
            details.localPosition.dy + scrollController.offset),
        strokeCap: context.read<DrawBloc>().state.strokeCap,
        currentColor: context.read<DrawBloc>().state.currentColor,
        currentStrokeWidth: context.read<DrawBloc>().state.currentStrokeWidth);
  }

  void onPanUpdate(
      NoteScreenState state, BuildContext context, DragUpdateDetails details) {
    // final renderBox = context.findRenderObject()! as RenderBox;

    Provider.of<DrawNoteNotifier>(context, listen: false).onPanUpdate(
        noteScreenStatus: state.noteScreenStatus,
        blockFunction: (data) =>
            context.read<DrawBloc>().add(OnPanUpdate(data)),
        pointPosition: Offset(details.localPosition.dx,
            details.localPosition.dy + scrollController.offset),
        strokeCap: context.read<DrawBloc>().state.strokeCap,
        currentColor: context.read<DrawBloc>().state.currentColor,
        currentStrokeWidth: context.read<DrawBloc>().state.currentStrokeWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Add Note'),
        actions: [
          TextButton(
              onPressed: () {
                context.read<NoteScreenBloc>().add(SaveNote(
                    drawingPoints: context.read<DrawBloc>().state.points));
                context.pop();
              },
              child: const Text('OK'))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NoteNavBar(),
      body: BlocListener<NoteScreenBloc, NoteScreenState>(
        listener: (context, state) {
          if (context.read<NoteScreenBloc>().noteId != null ||
              state.noteScreenStatus == NoteScreenStatus.success) {
            context.read<DrawBloc>().add(GetData(
                list: Provider.of<DrawNoteNotifier>(context, listen: false)
                    .drawingPoints));
          }
          log('message');
        },
        child: BlocBuilder<NoteScreenBloc, NoteScreenState>(
          builder: (context, state) {
            final blocValue = context.read<NoteScreenBloc>();

            return GestureDetector(
                onPanUpdate: (details) {
                  onPanUpdate(state, context, details);
                },
                onPanStart: (details) {
                  onPanStart(state, context, details);
                },
                onPanEnd: (details) {
                  onPanEnd(state, context);
                },
                onTapUp: (details) async {
                  if (state.noteScreenStatus != NoteScreenStatus.drawing) {
                    blocValue.add(AddTextField(
                        localPositionDx: details.localPosition.dx,
                        localPositionDy: details.localPosition.dy,
                        currentScrollOffset: scrollController.offset));
                    // blocValue.add(SetCurrentTextFieldIndex(index: index));
                  }
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: state.noteScreenStatus == NoteScreenStatus.drawing
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
                        const DrawScreen(),
                        for (int i = 0;
                            i < state.noteTextFieldModel.length;
                            i++)
                          Positioned(
                            left: state.noteTextFieldModel[i].position.dx,
                            top: state.noteTextFieldModel[i].position.dy,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  state.noteTextFieldModel[i].position.dx,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: DraggableWidget(
                                  boxConstraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context)
                                            .size
                                            .width -
                                        state.noteTextFieldModel[i].position.dx,
                                  ),
                                  onDragEnd: (details) {
                                    final renderBox = context.findRenderObject()
                                        as RenderBox?;
                                    if (renderBox == null) {
                                      return;
                                    }
                                    final localOffset =
                                        renderBox.globalToLocal(details.offset);
                                    blocValue.add(UpdateTextPosition(
                                        position: localOffset,
                                        updatedId: i,
                                        currentScrollOffset:
                                            scrollController.offset));
                                  },
                                  child: AddNoteTextField(
                                    onTap: () => blocValue.add(
                                        SetCurrentTextFieldIndex(index: i)),
                                    controller: state
                                        .noteTextFieldModel[i].textController,
                                    textStyle:
                                        state.noteTextFieldModel[i].textStyle,
                                    onChanged: (value) => blocValue.add(
                                        SaveTextFieldValue(
                                            value: value, index: i)),
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
