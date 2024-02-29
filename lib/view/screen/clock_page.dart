// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class ClockPage extends StatefulWidget {
//   const ClockPage({super.key});
//
//   @override
//   State<ClockPage> createState() => _ClockPageState();
// }
//
// class _ClockPageState extends State<ClockPage> {
//   DateTime da = DateTime.now();
//
//   void startClock() {
//     Future.delayed(
//       const Duration(seconds: 1),
//       () {
//         da = DateTime.now();
//         setState(() {});
//         startClock();
//       },
//     );
//   }
//
//   @override
//   void intState() {
//     super.initState();
//     startClock();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       backgroundColor: const Color(0xffEEF0E5),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffB6BBC4),
//         centerTitle: true,
//         title: const Text("Clock"),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: const Icon(Icons.backspace_outlined),
//         ),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(15),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             ...List.generate(
//               60,
//               (index) => Transform.rotate(
//                 angle: index * (pi * 2) / 60,
//                 child: Divider(
//                   endIndent:
//                       index % 5 == 0 ? size.width * 0.88 : size.width * 0.9,
//                   thickness: 3,
//                   color: index % 5 == 0 ? Colors.blueAccent : Colors.black54,
//                 ),
//               ),
//             ),
//
//             //hour
//             Transform.rotate(
//               angle: pi / 2,
//               child: Transform.rotate(
//                 angle: da.hour * (pi * 2) / 12,
//                 child: Divider(
//                   indent: 70,
//                   endIndent: size.width * 0.5 - 16,
//                   color: Colors.black,
//                   thickness: 4,
//                 ),
//               ),
//             ),
//
//             //minute
//             Transform.rotate(
//               angle: pi / 2,
//               child: Transform.rotate(
//                 angle: da.minute * (pi * 2) / 60,
//                 child: Divider(
//                   indent: 30,
//                   endIndent: size.width * 0.5 - 16,
//                   color: Colors.black,
//                   thickness: 3,
//                 ),
//               ),
//             ),
//
//             //second
//             Transform.rotate(
//               angle: pi / 2,
//               child: Transform.rotate(
//                 angle: da.second * (pi * 2) / 60,
//                 child: Divider(
//                   indent: 15,
//                   endIndent: size.width * 0.5 - 16,
//                   color: Colors.blueAccent,
//                   thickness: 3,
//                 ),
//               ),
//             ),
//             //dot
//             const CircleAvatar(
//               radius: 9,
//               backgroundColor: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
