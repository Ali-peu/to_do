import 'package:flutter/material.dart';

class FlagChange extends StatelessWidget {
  const FlagChange({super.key});

  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: 40,
            right: 10.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.15,
              child: Column(children: [
                Row(
                  children: [
                    flagIcons(Colors.green),
                    flagIcons(Colors.red),
                    flagIcons(Colors.blue),
                    flagIcons(Colors.amber),
                  ],
                ),
                Row(
                  children: [
                    circulNumber('1', const Color.fromARGB(255, 75, 225, 80)),
                    circulNumber('2', const Color.fromARGB(255, 194, 53, 43)),
                    circulNumber('3', const Color.fromARGB(255, 42, 131, 204)),
                    circulNumber('4', const Color.fromARGB(255, 231, 185, 47))
                  ],
                )
              ]),
            )));

    overlayState.insert(overlayEntry);

    await Future.delayed(const Duration(seconds: 2));

    overlayEntry.remove();
  }

  Widget flagIcons(Color color) {
    return Icon(Icons.flag, color: color, size: 12);
  }

  Widget circulNumber(String number, Color mycolor) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: mycolor),
        child: Text(
          number,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return showOverlay(context);
  }
}
