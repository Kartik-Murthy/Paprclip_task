import 'package:flutter/material.dart';
import 'package:paprclip_task/screens/home_screen.dart';

class AppClass {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }

    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
