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
        break;
      }
    }
    if (!l1.contains('')) {
      win.value = 'Draw';
    }
  }

  void getScore() async {
    xScore.value = await ShareHelper.shareHelper.getXScore();
    oScore.value = await ShareHelper.shareHelper.getOScore();
  }
}
