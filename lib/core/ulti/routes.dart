import 'package:ezovian/presentation/home_page/home_screen.dart';
import 'package:ezovian/presentation/login_page/login_screen.dart';
import 'package:ezovian/presentation/signup_page/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    signup: (context) => SignupScreen(),
    home: (context) => const HomeScreen(),
  };
}
