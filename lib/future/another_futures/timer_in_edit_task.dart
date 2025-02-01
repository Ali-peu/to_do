// import 'dart:async';
// import 'package:just_audio/just_audio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:circular_countdown_timer/circular_countdown_timer.dart';

// class MyTimer extends StatefulWidget {
//   const MyTimer({super.key});

//   @override
//   State<MyTimer> createState() => _MyTimerState();
// }

// class _MyTimerState extends State<MyTimer> {
//   bool isTimePicked = false;
//   int minute = 0;

//   bool isStopOrResume = false;
//   final player = AudioPlayer();
//   final CountDownController _controller = CountDownController();

//   TextEditingController timeController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     player.setAsset('sounds/timer_alam.wav');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: !isTimePicked
//             ? AlertDialog(
//                 title: SizedBox(
//                   width: 0.01,
//                   child: TextField(
//                     keyboardType:
//                         TextInputType.number, // Ограничьте ввод только числами
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.allow(
//                           RegExp(r'[0-9]')), // Разрешите только цифры
//                     ],
//                     controller: timeController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 15),
//                       hintText: 'Минута',
//                     ),
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         setState(() {
//                           minute = int.parse(timeController.text);
//                           minute = minute * 60;

//                           isTimePicked = true;
//                         });
//                       },
//                       child: const Text('Выбрать')),
//                 ],
//               )
//             : page());
//   }

//   Widget page() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         anotherTimer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextButton(
//                 onPressed: () {
//                   isStopOrResume ? _controller.pause() : _controller.resume();
//                   setState(() {
//                     isStopOrResume = !isStopOrResume;
//                   });
//                 },
//                 child:
//                     isStopOrResume ? const Text('Resume') : const Text("Stop")),
//             TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isTimePicked = false;
//                   });
//                 },
//                 child: const Text("New Time")),
//             TextButton(
//                 onPressed: () {
//                   unawaited(stopAlarm());
//                 },
//                 child: const Text("Stop music"))
//           ],
//         )
//       ],
//     );
//   }

//   Widget anotherTimer() {
//     return Center(
//       child: CircularCountDownTimer(
//         // Countdown duration in Seconds.
//         duration: minute,

//         // Countdown initial elapsed Duration in Seconds.
//         initialDuration: 0,

//         // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
//         controller: _controller,

//         // Width of the Countdown Widget.
//         width: MediaQuery.of(context).size.width / 2,

//         // Height of the Countdown Widget.
//         height: MediaQuery.of(context).size.height / 2,

//         // Ring Color for Countdown Widget.
//         ringColor: Colors.grey[300]!,

//         // Ring Gradient for Countdown Widget.
//         ringGradient: null,

//         // Filling Color for Countdown Widget.
//         fillColor: Colors.purpleAccent[100]!,

//         // Filling Gradient for Countdown Widget.
//         fillGradient: null,

//         // Background Color for Countdown Widget.
//         backgroundColor: Colors.purple[500],

//         // Background Gradient for Countdown Widget.
//         backgroundGradient: null,

//         // Border Thickness of the Countdown Ring.
//         strokeWidth: 20.0,

//         // Begin and end contours with a flat edge and no extension.
//         strokeCap: StrokeCap.round,

//         // Text Style for Countdown Text.
//         textStyle: const TextStyle(
//           fontSize: 33.0,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),

//         // Text Align for Countdown Text.

//         // Format for the Countdown Text.
//         textFormat: CountdownTextFormat.HH_MM_SS,

//         // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
//         isReverse: true,

//         // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
//         isReverseAnimation: false,

//         // Handles visibility of the Countdown Text.
//         isTimerTextShown: true,

//         // Handles the timer start.
//         autoStart: true,

//         // This Callback will execute when the Countdown Starts.
//         onStart: () {
//           // Here, do whatever you want
//           debugPrint('Countdown Started');
//         },

//         // This Callback will execute when the Countdown Ends.
//         onComplete: () {
//           playAlarm();

//           // Here, do whatever you want
//           debugPrint('Countdown Ended');
//         },

//         // This Callback will execute when the Countdown Changes.
//         onChange: (String timeStamp) {
//           // Here, do whatever you want
//           debugPrint('Countdown Changed $timeStamp');
//         },

//         /* 
//             * Function to format the text.
//             * Allows you to format the current duration to any String.
//             * It also provides the default function in case you want to format specific moments
//               as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
//               the default behavior.
//           */
//         timeFormatterFunction: (defaultFormatterFunction, duration) {
//           if (duration.inSeconds == 0) {
//             // only format for '0'
//             return "Start";
//           } else {
//             // other durations by it's default format
//             return Function.apply(defaultFormatterFunction, [duration]);
//           }
//         },
//       ),
//     );
//   }

//   Future<void> playAlarm() async {
//     await player.play();
//   }

//   Future<void> stopAlarm() async {
//     await player.stop();
//   }
// }
