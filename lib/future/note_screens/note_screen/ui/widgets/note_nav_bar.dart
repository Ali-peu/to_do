import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/configuration/assets/icon_assets.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';
import 'package:to_do/future/note_screens/note_screen/ui/widgets/add_favourite.dart';

class NoteNavBar extends StatelessWidget {
  const NoteNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteScreenBloc, NoteScreenState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue.shade100),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
                onTap: () {
                  context.read<NoteScreenBloc>().add(DrawLines());
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color:
                            state.noteScreenStatus == NoteScreenStatus.drawing ? Colors.red : null),
                    child: SvgPicture.asset(IconAssets.pen))),
            GestureDetector(
                onTap: () {},
                child: Text(
                  'Ж',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                )),
            GestureDetector(
                onTap: () {},
                child: Text(
                  'К',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontStyle: FontStyle.italic),
                )),
            GestureDetector(
              onPanDown: (details) {
                // final overlay = Overlay.of(context);
                // final boxPosition = details.globalPosition;

                // if (overlay != null) {
                //   final overlayEntry = OverlayEntry(
                //     builder: (context) => Positioned(
                //       top: boxPosition.dy, // Центрируем квадрат
                //       left: boxPosition.dx,
                //       child: const SizedBox(
                //         height: 100,
                //         width: 100,
                //         child: ColoredBox(color: Colors.red),
                //       ),
                //     ),
                //   );

                //   overlay.insert(overlayEntry);

                //   // Убираем квадрат через 2 секунды
                //   Future.delayed(const Duration(seconds: 2), () {
                //     overlayEntry.remove();
                //   });
                // }
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 25,
                width: 1,
                child: ColoredBox(color: Colors.black),
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
                  // value.isFavor = !value.isFavor;
                },
                child: AddFavourite(
                  isFavor: state.isFavourite,
                )),
          ]),
        ),
      );
    });
  }
}
