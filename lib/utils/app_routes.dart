import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screen/home/view/home_screen.dart';
import 'package:tic_tac_toe/screen/multiplayer/view/aibot_game.dart';
import 'package:tic_tac_toe/screen/multiplayer/view/multi_player_screen.dart';
import 'package:tic_tac_toe/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'multi': (context) => const MultiPlayerScreen(),
  'ai': (context) => const AibotGameScreen(),
};
// &&controller.win.value.isEmpty
// String w1 = l1[winn[0]];
// String w2 = l1[winn[1]];
// String w3 = l1[winn[2]];
// if (w1 == w2 && w1 == w3 && w1.isNotEmpty) {
//   win.value = w1;
//   return;
// }

// if (controller.list[index] == '' &&
//     controller.win.value.isEmpty) {
//   if (controller.count.value % 2 == 0) {
//     controller.list[index] = "X";
//   } else {
//     controller.list[index] = "O";
//   }
//   controller.count.value++;
//   controller.checkWinner();
// }
