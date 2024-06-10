import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<String> l1 = List<String>.filled(9, '').obs;
  RxInt count = 0.obs;
  RxString win = ''.obs;

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

    for (var pattern in winPatterns) {
      if (l1[pattern[0]] != '' &&
          l1[pattern[0]] == l1[pattern[1]] &&
          l1[pattern[1]] == l1[pattern[2]]) {
        win.value = l1[pattern[0]];
        break;
      }
    }

    if (win.value == '' && !l1.contains('')) {
      win.value = 'Draw';
    }
  }
}
