import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do/configuration/assets/icon_assets.dart';
import 'package:to_do/future/draw_screen/bloc/draw_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/add_favourite.dart';

class NoteNavBar extends StatelessWidget {
  const NoteNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

      log(isKeyBoardOpen.toString());
      return BlocBuilder<NoteScreenBloc, NoteScreenState>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue.shade100),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.read<NoteScreenBloc>().add(DrawLines());
                      },
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: state.noteScreenStatus ==
                                      NoteScreenStatus.drawing
                                  ? Colors.yellow.shade500
                                  : null),
                          child: SizedBox(
                            height: 20,
                            width: 10,
                            child: SvgPicture.asset(
                              IconAssets.pen,
                            ),
                          ))),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: context
                                      .read<DrawBloc>()
                                      .state
                                      .currentColor,
                                  onColorChanged: (color) {
                                    context
                                        .read<DrawBloc>()
                                        .add(SetColor(color));
                                  },
                                  pickerAreaHeightPercent: 0.8,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Save'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Colors.yellow,
                            Colors.red,
                          ], end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {}, child: SvgPicture.asset(IconAssets.image)),
                  GestureDetector(
                      onTap: () {
                        // value.drawNoteNotifier.clearDrawing();
                      },
                      child: SvgPicture.asset(IconAssets.audio)),
                  GestureDetector(
                      onTap: () {
                        context.read<NoteScreenBloc>().add(IncreaseTextSize());
                      },
                      child: const Icon(Icons.text_increase)),
                  GestureDetector(
                      onTap: () {
                        context.read<NoteScreenBloc>().add(DecreaseTextSize());
                      },
                      child: const Icon(Icons.text_decrease)),
                  GestureDetector(
                      onTap: () {
                        // value.isFavor = !value.isFavor;
                      },
                      child: AddFavourite(
                        isFavor: state.isFavourite,
                      )),
                ]),
          ),
        );
      });
    });
  }
}
