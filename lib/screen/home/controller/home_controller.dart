// import 'dart:math';
//
// import 'package:get/get.dart';
// import 'package:tic_tac_toe/utils/share_helper.dart';
//
// class HomeController extends GetxController {
//   RxList list = ["", "", "", "", "", "", "", "", ""].obs;
//   RxInt count = 0.obs;
//   RxString win = ''.obs;
//   RxInt xScore = 0.obs;
//   RxInt oScore = 0.obs;
//
//   void resetGame() {
//     list.value = List<String>.filled(9, '');
//     count.value = 0;
//     win.value = '';
//   }
//
//   void checkWinner() {
//     List<List<int>> winPatterns = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6]
//     ];
//     for (var winn in winPatterns) {
//       if (list[winn[0]] != '' &&
//           list[winn[0]] == list[winn[1]] &&
//           list[winn[1]] == list[winn[2]]) {
//         win.value = list[winn[0]];
//         if (win.value == 'X') {
//           xScore.value++;
//           ShareHelper.shareHelper.saveXScore(xScore.value);
//           win.value = 'X';
//         } else if (win.value == 'O') {
//           oScore.value++;
//           ShareHelper.shareHelper.saveOScore(oScore.value);
//           win.value = 'O';
//         }
//         break;
//       }
//     }
//     if (!list.contains('')) {
//       win.value = 'Draw';
//     }
//   }
//
//   void getScore() async {
//     xScore.value = await ShareHelper.shareHelper.getXScore();
//     oScore.value = await ShareHelper.shareHelper.getOScore();
//   }
//
//   void aiMove() {
//     if (win.value.isNotEmpty) return;
//     var emptyIndexes = [];
//     for (int i = 0; i < list.length; i++) {
//       if (list[i] == '') {
//         emptyIndexes.add(i);
//       }
//     }
//     if (emptyIndexes.isNotEmpty) {
//       final random = Random();
//       int aiMoveIndex = emptyIndexes[random.nextInt(emptyIndexes.length)];
//       list[aiMoveIndex] = 'O';
//       count.value++;
//       checkWinner();
//     }
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/share_helper.dart';

class HomeController extends GetxController {
  var list = List.filled(9, '').obs;
  var count = 0.obs;
  var xScore = 0.obs;
  var oScore = 0.obs;
  var win = ''.obs;

  void getScore() async {
    xScore.value = await ShareHelper.shareHelper.getXScore();
    oScore.value = await ShareHelper.shareHelper.getOScore();
  }

  void resetGame() {
    list.value = List<String>.filled(9, '');
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
      if (list[winn[0]] != '' &&
          list[winn[0]] == list[winn[1]] &&
          list[winn[1]] == list[winn[2]]) {
        win.value = list[winn[0]];
        if (win.value == 'X') {
          xScore.value++;
          ShareHelper.shareHelper.saveXScore(xScore.value);
          win.value = 'X';
        } else if (win.value == 'O') {
          oScore.value++;
          ShareHelper.shareHelper.saveOScore(oScore.value);
          win.value = 'O';
        }
        break;
      }
    }
    if (!list.contains('')) {
      win.value = 'Draw';
    }
  }

  Future<bool> onWillPop() async {
    bool? result = await Get.defaultDialog(
      title: 'Exit Game',
      middleText: 'Are you sure you want to exit the game?',
      textCancel: 'No',
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onConfirm: () {
        list.fillRange(0, 9, '');
        Get.back(result: true);
      },
    );
    return result ?? false;
  }

  void aiMove() {
    if (win.value.isNotEmpty) return;
    int bestScore = -1000;
    int bestMove = -1;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == '') {
        list[i] = 'O';
        int score = minimax(list, 0, false);
        list[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    if (bestMove != -1) {
      list[bestMove] = 'O';
      count.value++;
      checkWinner();
    }
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    String result = getWinner(board);
    if (result != '') {
      if (result == 'O') return 10 - depth;
      if (result == 'X') return depth - 10;
      return 0;
    }
    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          int score = minimax(board, depth + 1, false);
          board[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          int score = minimax(board, depth + 1, true);
          board[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  String getWinner(List<String> board) {
    const List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
      [0, 4, 8], [2, 4, 6] // diagonals
    ];
    for (var pattern in winPatterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];
      if (a == b && b == c && a != '') {
        return a;
      }
    }
    if (!board.contains('')) {
      return 'Draw';
    }
    return '';
  }
}
