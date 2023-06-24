import 'package:flutter/material.dart';
import 'package:task_project/ui/timer_stopwatch/stopwatch_tab.dart';
import 'package:task_project/ui/timer_stopwatch/timer_tab.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Timer",
                ),
                Tab(
                  text: "Stopwatch",
                ),
              ],
            ),
          ),

          body: const TabBarView(
            children: [
              TimerTab(),
              StopWatchTab()
            ],
          )
        )
    );
  }
}
