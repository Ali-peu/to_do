import 'package:flutter/material.dart';

const Color purple = Color.fromARGB(255, 63, 45, 149);

class TimerFrame extends StatelessWidget {
  final Widget timer;
  final bool inverted;

  const TimerFrame({
    required this.timer,
    this.inverted = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: inverted ? 30 : 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: inverted ? Colors.white : purple,
        border: Border.all(
          width: 2,
          color: inverted ? purple : Colors.transparent,
        ),
      ),
      child: timer,
    );
  }
}
