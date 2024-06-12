import Flutter
import UIKit
import XCTest

class RunnerTests: XCTestCase {

  func testExample() {
    // If you add code to the Runner application, consider adding tests here.
    // See https://developer.apple.com/documentation/xctest for more information about using XCTest.
  }

}
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeController extends GetxController {
//   var xScore = 0.obs;
//   var oScore = 0.obs;
//   var l1 = List.filled(9, '').obs;
//   var count = 0.obs;
//   var win = ''.obs;
//
//   HomeController() {
//     loadScores();
//   }
//
//   Future<void> loadScores() async {
//     final prefs = await SharedPreferences.getInstance();
//     xScore.value = prefs.getInt('xScore') ?? 0;
//     oScore.value = prefs.getInt('oScore') ?? 0;
//   }
//
//   Future<void> saveScores() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('xScore', xScore.value);
//     await prefs.setInt('oScore', oScore.value);
//   }
//
//   void checkWinner() {
//     const winPatterns = [
//       [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
//       [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
//       [0, 4, 8], [2, 4, 6] // diagonals
//     ];
//
//     for (var pattern in winPatterns) {
//       String a = l1[pattern[0]];
//       String b = l1[pattern[1]];
//       String c = l1[pattern[2]];
//
//       if (a != '' && a == b && a == c) {
//         win.value = a;
//         if (a == 'X') {
//           xScore.value++;
//         } else {
//           oScore.value++;
//         }
//         saveScores();
//         return;
//       }
//     }
//
//     if (!l1.contains('')) {
//       win.value = 'Draw';
//     }
//   }
//
//   void resetGame() {
//     l1.value = List.filled(9, '');
//     count.value = 0;
//     win.value = '';
//   }
//
//   void makeMove(int index) {
//     if (l1[index] == '' && win.value.isEmpty) {
//       if (count.value % 2 == 0) {
//         l1[index] = "X";
//       } else {
//         l1[index] = "O";
//       }
//       count.value++;
//       checkWinner();
//
//       if (win.value.isEmpty && count.value % 2 != 0) {
//         makeAIMove();
//       }
//     }
//   }
//
//   void makeAIMove() {
//     for (int i = 0; i < l1.length; i++) {
//       if (l1[i] == '') {
//         l1[i] = "O";
//         count.value++;
//         checkWinner();
//         break;
//       }
//     }
//   }
// }
//  HomeController() {
//     getScore();
//   }