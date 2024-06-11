import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/share_helper.dart';

class HomeController extends GetxController {
  RxList l1 = ["", "", "", "", "", "", "", "", ""].obs;
  RxInt count = 0.obs;
  RxString win = ''.obs;
  RxInt xScore = 0.obs;
  RxInt oScore = 0.obs;

  void resetGame() {
    l1.value = List<String>.filled(9, '');
    count.value = 0;
    win.value = '';
  }

  void checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var winn in winPatterns) {
      if (l1[winn[0]] != '' &&
          l1[winn[0]] == l1[winn[1]] &&
          l1[winn[1]] == l1[winn[2]]) {
        win.value = l1[winn[0]];
        if (win.value == 'X') {
          xScore.value++;
          ShareHelper.shareHelper.saveXScore(xScore.value);
          win.value = 'X';
        } else if (win.value == 'O') {
          oScore.value++;
          ShareHelper.shareHelper.saveOScore(oScore.value);
          win.value = 'O';
        }
      }
    }
    if (!l1.contains('')) {
      win.value = 'Draw';
    }
  }

  HomeController() {
    getScore();
  }

  void getScore() async {
    xScore.value = await ShareHelper.shareHelper.getXScore();
    oScore.value = await ShareHelper.shareHelper.getOScore();
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