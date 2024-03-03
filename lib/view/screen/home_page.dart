import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime da = DateTime.now();

  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      da = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  bool _isAnalog = false;
  bool _isStrap = true;
  bool _isimage = false;
  bool _isStopwatch = false;

  int sec = 0;
  int min = 0;
  int hou = 0;
  String strSec = "00";
  String strMin = "00";
  String strHou = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sec++;
      if (sec > 59) {
        if (min > 59) {
          hou++;
          min = 0;
        } else {
          min++;
          sec = 0;
        }
      }
      setState(() {
        min = min;
        hou = hou;

        strSec = (sec >= 10) ? "$sec" : "0$sec";
        strHou = (sec >= 10) ? "$hou" : "0$hou";
        strMin = (min >= 10) ? "$min" : "0$min";
      });
    });
  }

  void resetStopWatch() {
    timer!.cancel();
    setState(() {
      started = false;
      sec = 0;
      min = 0;
      hou = 0;

      strSec = "00";
      strMin = "00";
      strHou = "00";
    });
  }

  List imagess = [
    "https://i.pinimg.com/564x/7b/5f/06/7b5f066bd5391ecb2252b5a53fe0708f.jpg",
    "https://i.pinimg.com/564x/8c/a6/b7/8ca6b7afb0196a7624140feab2acb87e.jpg",
    "https://i.pinimg.com/564x/97/76/3e/97763ec63fbc705b44bf7521689e18db.jpg",
    "https://i.pinimg.com/564x/b2/ec/7e/b2ec7e043bfbc4445e9d7cc42c37c2ef.jpg",
    "https://i.pinimg.com/564x/04/0f/d6/040fd68b56064f80458ec2a565aa5b1a.jpg",
    "https://i.pinimg.com/564x/a5/35/8f/a5358f638bfd0486ae594f8cf5d24101.jpg",
    "https://i.pinimg.com/564x/5a/69/fe/5a69fe13ae3120b9f9461a300ce4e37a.jpg",
    "https://i.pinimg.com/564x/c5/97/de/c597deec483a3d3d04f3e20303173bc3.jpg",
  ];
  String backgroundimg = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAF0E6),
        centerTitle: true,
        title: const Text(
          "Clock's",
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage("assets/image/abhi.jpg"),
              ),
              accountName: Text("ABHI GHOGHARI"),
              accountEmail: Text("abhighoghari@gmail.com"),
            ),
            //Digital Watch
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Time:${da.hour}: ${da.minute}: ${da.second}: ${da.hour < 12 ? "AM" : "PM"}\n Date: ${da.day}: \n Day: ${da.weekday}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //Stop Watch
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Stop Watch",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _isStopwatch,
                    onChanged: (val) => _isStopwatch = !_isStopwatch,
                  ),
                ],
              ),
            ),
            //Analog Watch
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Analog clock",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _isAnalog,
                    onChanged: (val) => _isAnalog = !_isAnalog,
                  ),
                ],
              ),
            ),
            //Strap Watch
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Strap clock",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: _isStrap,
                    onChanged: (val) => _isStrap = !_isStrap,
                  ),
                ],
              ),
            ),
            //image
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Images",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _isimage,
                    onChanged: (val) => _isimage = !_isimage,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isimage,
              child: Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: imagess
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              backgroundimg = e;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              height: size.height * 0.4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Colors.blue,
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _isimage
                ? NetworkImage(backgroundimg)
                : const NetworkImage(
                    "https://i.pinimg.com/564x/fd/46/84/fd4684b7335f291e9bb9120cc330c268.jpg",
                  ),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // AnalogWatch
            Visibility(
              visible: _isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: index * (pi * 2) / 60,
                      child: Divider(
                        endIndent: index % 5 == 0
                            ? size.width * 0.88
                            : size.width * 0.9,
                        thickness: 3,
                        color:
                            index % 5 == 0 ? Colors.blueAccent : Colors.black54,
                      ),
                    ),
                  ),
                  //hour
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: da.hour * (pi * 2) / 12,
                      child: Divider(
                        indent: 50,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 4,
                      ),
                    ),
                  ),
                  //minute
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: da.minute * (pi * 2) / 60,
                      child: Divider(
                        indent: 30,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 3,
                      ),
                    ),
                  ),
                  //second
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: da.second * (pi * 2) / 60,
                      child: Divider(
                        indent: 20,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.blueAccent,
                        thickness: 2.5,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
            // StrapWatch
            Visibility(
              visible: _isStrap,
              child: Stack(
                children: [
                  // Hour
                  Transform.scale(
                    scale: 7,
                    child: CircularProgressIndicator(
                      value: da.hour / 12.toDouble(),
                      strokeWidth: 1.7,
                    ),
                  ),
                  // Minutes
                  Transform.scale(
                    scale: 5,
                    child: CircularProgressIndicator(
                      value: da.minute / 60.toDouble(),
                      strokeWidth: 1.3,
                    ),
                  ),
                  // Second
                  Transform.scale(
                    scale: 3,
                    child: CircularProgressIndicator(
                      value: da.second / 60.toDouble(),
                      strokeWidth: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isStopwatch,
              child: CircleAvatar(
                radius: 200,
                backgroundColor: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$strHou : $strMin : $strSec",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            start();
                          },
                          child: Text("${started ? "Started" : "Start"}"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            resetStopWatch();
                          },
                          child: const Text("reset"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
