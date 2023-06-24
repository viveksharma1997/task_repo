import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchTab extends StatefulWidget {
  const StopWatchTab({Key? key}) : super(key: key);

  @override
  State<StopWatchTab> createState() => _StopWatchTabState();
}

class _StopWatchTabState extends State<StopWatchTab> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _result = '00:00:00';

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      setState(() {
        _result = '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    _stopwatch.start();
  }

  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  void _reset() {
    _stop();
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_result, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Start button
            ElevatedButton(
              onPressed: _start,
              child: const Text('Start'),
            ),
            // Stop button
            ElevatedButton(
              onPressed: _stop,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Stop'),
            ),
            // Reset button
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Reset'),
            ),
          ],
        ),

        // TextButton(
        //   style: TextButton.styleFrom(
        //     primary: Colors.blue,
        //   ),
        //   onPressed: () {
        //
        //   },
        //   child: const Text('Start'),
        // )
      ],
    );
  }
}
