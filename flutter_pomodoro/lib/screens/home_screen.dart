import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSec = twentyFiveMinutes;
  bool isRunning = false;
  late Timer timer;
  int totalPomodoros = 0;

  void onTick(Timer timer) {
    setState(() {
      if (totalSec == 0) {
        totalPomodoros++;
        isRunning = false;
        totalSec = twentyFiveMinutes;
        timer.cancel();
      } else {
        totalSec--;
      }
    });
  }

  void onStartPressed() {
    isRunning = !isRunning;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = !isRunning;
    });
  }

  String format(int sec) {
    var duration = Duration(seconds: sec);

    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSec),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 120,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline_outlined
                      : Icons.play_circle_outlined,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pomodoros',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.displayLarge!.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$totalPomodoros',
                    style: TextStyle(
                      fontSize: 58,
                      color: Theme.of(context).textTheme.displayLarge!.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
