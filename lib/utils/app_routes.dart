import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screen/home/view/home_screen.dart';
import 'package:tic_tac_toe/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
};
