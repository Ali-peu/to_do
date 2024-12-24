import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do/configuration/assets/icon_assets.dart';
import 'package:to_do/future/task_screens/add_note_screen/add_note_screen_model_view.dart';
import 'package:to_do/future/task_screens/add_note_screen/widgets/add_favourite.dart';

class NoteNavBar extends StatelessWidget {
  const NoteNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNoteScreenModelView>(builder: (context, value, child) {
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
                  value.isChoisePencil = !value.isChoisePencil;
                },
                child: Container(
                    // height: 30,
                    decoration: BoxDecoration(
                        color: value.isChoisePencil ? Colors.red : null),
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
              onLongPress: () {},
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
                  value.clearDrawing();
                },
                child: SvgPicture.asset(IconAssets.audio)),
            GestureDetector(
                onTap: () {
                  value.isFavor = !value.isFavor;
                },
                child: AddFavourite(
                  isFavor: value.isFavor,
                )),
          ]),
        ),
      );
    });
  }
}
