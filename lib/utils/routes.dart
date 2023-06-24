import 'package:flutter/material.dart';
import 'package:task_project/ui/dashboard/dashboard_screen.dart';
import 'package:task_project/ui/home_screen.dart';
import 'package:task_project/ui/auth/login_screen.dart';
import 'package:task_project/ui/timer_stopwatch/timer_screen.dart';
import 'package:task_project/utils/constants.dart';

class Routers{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case timerStopWatchRoute:
        return MaterialPageRoute(builder: (_) => const TimerScreen());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route define for ${settings.name}")),
          ),
        );
    }
  }

}