import 'package:flutter/material.dart';
import 'package:task_project/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {
              Navigator.pushNamed(context, timerStopWatchRoute);
            },
            child: const Text('Timer Page'),
          ),
          const SizedBox(height: 40),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: () {
              Navigator.pushNamed(context, loginRoute);
            },
            child: const Text('Login Page'),
          )
        ],
      ),
    );
  }
}
