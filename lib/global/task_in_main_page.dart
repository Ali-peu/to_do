// import 'package:flutter/material.dart';
// import 'package:to_do/global/deskription_task.dart';

// class TaskWidget extends StatelessWidget {
//   const TaskWidget({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => EditTask(),
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Container(
//           width: double.infinity,
//           height: 60,
//           child: Row(
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.expand_circle_down_outlined),
//                 iconSize: 30,
//               ),
//               const Text(
//                 "Our future task",
//                 style: TextStyle(fontSize: 30),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
