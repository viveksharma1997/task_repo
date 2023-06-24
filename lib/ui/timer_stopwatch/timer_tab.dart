import 'dart:async';

import 'package:flutter/material.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key? key}) : super(key: key);

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  static const countdownDuration = Duration(minutes: 5);
  Duration duration = const Duration();
  Timer? timer;

  bool countDown =true;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset(){
    if (countDown){
      setState(() =>
      duration = countdownDuration);
    } else{
      setState(() =>
      duration = const Duration());
    }
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
      } else{
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(height: 80),
            buildButtons()
          ],
        ),
      ),
    );
  }

  Widget buildTime(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$hours : ",style: const TextStyle(color: Colors.black45, fontSize: 30)),
          Text("$minutes : ",style: const TextStyle(color: Colors.black45, fontSize: 30)),
          Text(seconds,style: const TextStyle(color: Colors.black45, fontSize: 30))
        ]
    );
  }

  Widget buildButtons(){
    final isRunning = timer == null? false: timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            if (isRunning){
              stopTimer(resets: false);
            }
          },
          child: const Text('STOP', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: stopTimer,
          child: const Text('CANCEL', style: TextStyle(color: Colors.white)),
        ),
      ],
    )
    : TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: (){
        startTimer();
      },
      child: const Text('Start Timer', style: TextStyle(color: Colors.white)),
    );

  }
}
