import 'package:tic_tac_toe/utils/export.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'multi': (context) => const MultiPlayerScreen(),
  'ai': (context) => const AibotGameScreen(),
};

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
//
/*
controller
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
*/
/*void aiMove() {
    if (win.value.isNotEmpty) return;
    var emptyIndexes = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] == '') {
        emptyIndexes.add(i);
      }
    }
    if (emptyIndexes.isNotEmpty) {
      final random = Random();
      int aiMoveIndex = emptyIndexes[random.nextInt(emptyIndexes.length)];
      list[aiMoveIndex] = 'O';
      count.value++;
      checkWinner();
    }
  }*/
